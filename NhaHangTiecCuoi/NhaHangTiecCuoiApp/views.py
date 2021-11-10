from django.conf import settings
from django.shortcuts import render

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
    queryset = WeddingLobby.objects.all()
    serializer_class = WeddingLobbySerializer
    pagination_class = BasePagination


class WeddingLobbyViewSet(viewsets.ViewSet, generics.RetrieveAPIView):
    queryset = WeddingLobby.objects.all()
    serializer_class = WeddingLobbyDetailsSerializer


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
    queryset = Service.objects.filter(active=True)
    serializer_class = ServiceSerializer
    pagination_class = BasePagination


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


# API Authorization
class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)