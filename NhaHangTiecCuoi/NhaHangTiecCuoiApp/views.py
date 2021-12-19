from django.conf import settings
from django.http import Http404
from django.shortcuts import render
import dateutil.parser as parser

# Create your views here.
# from oauth2_provider.contrib.rest_framework import permissions
from rest_framework.response import Response
from rest_framework import viewsets, generics, permissions, status
from rest_framework.decorators import action
from rest_framework.parsers import MultiPartParser
from rest_framework.views import APIView

from .serializers import *
from .paginator import BasePagination


def index(request):
    return render(request, template_name='index.html', context={
        'name': 'Trang chủ'
    })


# API register*
class UserViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.UpdateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [MultiPartParser, ]

    def get_permissions(self):
        if self.action == 'get_current_user':
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['get'], detail=False, url_path="current-user")
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user, context={"request": request}).data,
                        status=status.HTTP_200_OK)


# API lobby*

class MenuLobbyViewSet(viewsets.ViewSet, generics.ListAPIView):
    # queryset = WeddingLobby.objects.all()
    serializer_class = WeddingLobbySerializer
    pagination_class = BasePagination

    def get_queryset(self):
        lobbies = WeddingLobby.objects.all()

        q = self.request.query_params.get('q')
        if q is not None:
            lobbies = lobbies.filter(name__icontains=q)

        return lobbies


class WeddingLobbyViewSet(viewsets.ViewSet, generics.RetrieveAPIView):
    queryset = WeddingLobby.objects.all()
    serializer_class = WeddingLobbyDetailsSerializer

    def get_queryset(self):
        lobbies = WeddingLobby.objects.all()

        q = self.request.query_params.get('q')
        if q is not None:
            lobbies = lobbies.filter(name__icontains=q)

        return lobbies


class WeddingLobbyPriceViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = WeddingLobbyPrice.objects.all()
    serializer_class = WeddingLobbyPriceSerializer

    def get_queryset(self):
        prices = WeddingLobbyPrice.objects.all()

        q = self.request.query_params.get('q')
        if q is not None:
            prices = prices.filter(price__lte=q)

        return prices


# API menu-drink*

class MenuDrinkViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = MenuDrink.objects.filter(active=True)
    serializer_class = MenuDrinkSerializer
    pagination_class = BasePagination


# API menu-food*

class MenuFoodViewSet(viewsets.ViewSet, generics.ListAPIView):
    # queryset = MenuFood.objects.filter(active=True)
    serializer_class = MenuFoodSerializer
    pagination_class = BasePagination

    def get_queryset(self):
        foods = MenuFood.objects.filter(active=True)

        q = self.request.query_params.get('q')
        if q is not None:
            foods = foods.filter(name__icontains=q)

        return foods


class MenuFoodDetailViewSet(viewsets.ViewSet, generics.RetrieveAPIView):
    queryset = MenuFood.objects.filter(active=True)
    serializer_class = MenuFoodDetailSerializer


class FoodTypeViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = FoodType.objects.all()
    serializer_class = FoodTypeSerializer

    @action(methods=['get'], detail=True, url_path='foods')
    def get_foods(self, request, pk):
        foods = FoodType.objects.get(pk=pk).menu_foods.filter(active=True)

        q = request.query_params.get('q')
        if q is not None:
            foods = foods.filter(name__icontains=q)

        return Response(MenuFoodSerializer(foods, many=True, context={"request": request}).data,
                        status=status.HTTP_200_OK)


# API Service*

class ServiceTypeViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = ServiceType.objects.all()
    serializer_class = ServiceTypeSerializer

    @action(methods=['get'], detail=True, url_path='services')
    def get_services(self, request, pk):
        service = ServiceType.objects.get(pk=pk).services.filter(active=True)

        q = request.query_params.get('q')
        if q is not None:
            service = service.filter(name__icontains=q)

        return Response(ServiceSerializer(service, many=True, context={"request": request}).data,
                        status=status.HTTP_200_OK)


class ServiceViewSet(viewsets.ViewSet, generics.ListAPIView):
    # queryset = Service.objects.filter(active=True)
    serializer_class = ServiceSerializer
    pagination_class = BasePagination

    def get_queryset(self):
        services = Service.objects.filter(active=True)

        q = self.request.query_params.get('q')
        if q is not None:
            services = services.filter(name__icontains=q)

        return services


class WeddingEventViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = ServiceType.objects.filter(event_type=1)
    serializer_class = ServiceTypeSerializer
    pagination_class = BasePagination


class ConferenceEventViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = ServiceType.objects.filter(event_type=2)
    serializer_class = ServiceTypeSerializer
    pagination_class = BasePagination


class BirthdayEventViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = ServiceType.objects.filter(event_type=3)
    serializer_class = ServiceTypeSerializer
    pagination_class = BasePagination


# API Feedback

class FeedbackViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Feedback.objects.order_by("-id").all()
    serializer_class = FeedBackSerializer

    def get_permissions(self):
        if self.action == 'add_feedback':
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['post'], detail=False, url_path="add_feedback")
    def add_feedback(self, request):
        content = request.data.get('content')
        if content:
            f = Feedback.objects.create(content=content,
                                        user=request.user)

            return Response(FeedBackSerializer(f, context={"request": request}).data,
                            status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)


# API Rating

class RatingViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.UpdateAPIView, generics.ListAPIView):
    serializer_class = RatingSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        usr = self.request.user
        return Rating.objects.filter(user=usr)

    def partial_update(self, request, *args, **kwargs):
        if request.user == self.get_object().user:
            return super().partial_update(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)


# API Book a party

class InvoiceViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Invoice.objects.order_by('-id').all()
    serializer_class = InvoiceSerializer
    permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=False, url_path="book_party")
    def book_party(self, request):
        party_name = request.data.get('party_name')
        table_quantity = request.data.get('table_quantity')
        rental_date = request.data.get('rental_date')
        lobby_price = request.data.get('lobby_price')
        session = request.data.get('session')
        total_bill = request.data.get('totalBill')
        wedding_lobby = request.data.get('wedding_lobby')
        payment_method = request.data.get('payment_method')
        payment = PaymentMethod.objects.get(id=payment_method)
        lobby = WeddingLobby.objects.get(id=wedding_lobby)
        date = parser.parse(rental_date, fuzzy=True)

        if party_name and table_quantity and rental_date and rental_date and lobby_price \
                and session and total_bill and wedding_lobby and payment_method:
            f = Invoice.objects.create(party_name=party_name,
                                       table_quantity=table_quantity,
                                       rental_date=date,
                                       lobby_price=lobby_price,
                                       totalBill=total_bill,
                                       session=session,
                                       wedding_lobby=lobby,
                                       payment_method=payment,
                                       user=request.user)

            return Response(InvoiceSerializer(f, context={"request": request}).data,
                            status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)


class FoodBillViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = FoodBillDetail.objects.all()
    serializer_class = FoodBillSerializer
    permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=False, url_path="book_foods")
    def book_food(self, request):
        foods = request.data.get("foods")

        if foods:
            for food in foods:
                menu = MenuFood.objects.get(id=food['menu_food'])
                invoice = Invoice.objects.get(id=food['invoice'])
                FoodBillDetail.objects.create(unit_price=food['unit_price'],
                                              menu_food=menu,
                                              invoice=invoice)
            return Response(status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)


class DrinkBillViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = DrinkBillDetail.objects.all()
    serializer_class = DrinkBillSerializer
    permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=False, url_path="book_drinks")
    def book_drink(self, request):
        drinks = request.data.get("drinks")

        if drinks:
            for drink in drinks:
                menu = MenuDrink.objects.get(id=drink['menu_drink'])
                invoice = Invoice.objects.get(id=drink['invoice'])
                DrinkBillDetail.objects.create(unit_price=drink['unit_price'],
                                               quantity=drink['quantity'],
                                               unit=drink['unit'],
                                               menu_drink=menu,
                                               invoice=invoice)

            return Response(status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)


class ServiceBillViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = ServiceBillDetail.objects.all()
    serializer_class = ServiceBillSerializer
    permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=False, url_path="book_services")
    def book_service(self, request):
        services = request.data.get("services")

        if services:
            for service in services:
                service = MenuDrink.objects.get(id=service['service'])
                invoice = Invoice.objects.get(id=service['invoice'])
                ServiceBillDetail.objects.create(unit_price=service['unit_price'],
                                                 service=service,
                                                 invoice=invoice)

            return Response(status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)


# API Payment Method

class PaymentMethodViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = PaymentMethod.objects.order_by('id').all()
    serializer_class = PaymentMethodSerializer


# API Authorization
class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)
