from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
# from oauth2_provider.contrib.rest_framework import permissions
from requests import Response
from rest_framework import viewsets, generics, permissions, status
from rest_framework.decorators import action
from rest_framework.parsers import MultiPartParser

from .models import *
from .serializers import *


def index(request):
    return render(request, template_name='index.html', context={
        'name': 'Trang chủ'
    })


# API đăng ký*
class UserViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.UpdateAPIView, generics.RetrieveAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [MultiPartParser, ]

    # xem thông tin của user được chứng thực*
    def get_permissions(self):
        if self.action == 'retrieve':
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    # lấy user hiện tại*
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user).data, status=status.HTTP_200_OK)


# API sảnh tiệc*

class MenuLobbyViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = WeddingLobby.objects.all()
    serializer_class = WeddingLobbySerializer


class WeddingLobbyViewSet(viewsets.ViewSet, generics.RetrieveAPIView):
    queryset = WeddingLobby.objects.all()
    serializer_class = WeddingLobbyDetailsSerializer


# API menu-drink*

class MenuDrinkViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = MenuDrink.objects.filter(active=True)
    serializer_class = MenuDrinkSerializer


# API menu-food*

class MenuFoodViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = MenuFood.objects.filter(active=True)
    serializer_class = MenuFoodSerializer


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

        return Response(MenuFoodSerializer(foods, many=True).data,
                        status=status.HTTP_200_OK)

