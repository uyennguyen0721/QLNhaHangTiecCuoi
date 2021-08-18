from rest_framework.serializers import ModelSerializer
from .models import *


# user*
class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "first_name", "last_name", "email", "username", "password", "avatar"]
        extra_kwargs = {
            'password': {'write_only': 'true'}
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user


# sảnh tiệc*
class WeddingLobbyPriceSerializer(ModelSerializer):
    class Meta:
        model = WeddingLobbyPrice
        fields = ['id', 'time', 'is_weekend', 'price', ]


class WeddingLobbySerializer(ModelSerializer):
    wedding_lobby_prices = WeddingLobbyPriceSerializer(many=True, read_only=True)

    class Meta:
        model = WeddingLobby
        fields = ['id', 'name', 'image', 'location', 'capacity', 'description', 'wedding_lobby_prices']


# menu-drink*
class MenuDrinkSerializer(ModelSerializer):
    class Meta:
        model = MenuDrink
        fields = ['id', 'name', 'price', 'image', 'unit']


# menu-food
class MenuFoodSerializer(ModelSerializer):
    class Meta:
        model = MenuFood
        fields = ['id', 'name', 'price', 'image']


class FoodTypeSerializer(ModelSerializer):
    menu_foods = MenuFoodSerializer(many=True, read_only=True)

    class Meta:
        model = FoodType
        fields = ['id', 'name', 'menu_foods']
