from rest_framework.fields import SerializerMethodField
from rest_framework.serializers import ModelSerializer
from .models import *


# API user*
class UserSerializer(ModelSerializer):
    # avatar = SerializerMethodField()
    #
    # def get_avatar(self, user):
    #     request = self.context['request']
    #     if user.avatar:
    #         name = user.avatar.name
    #         if name.startswith("static/"):
    #             path = '/%s' % name
    #         else:
    #             path = '/static/%s' % name
    #
    #         return request.build_absolute_uri(path)

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(user.password)
        user.save()

        return user

    class Meta:
        model = User
        fields = ["id", "first_name", "last_name", "avatar", "phone", "address",
                  "username", "password", "email"]
        extra_kwargs = {
            'password': {'write_only': 'true'}
        }


# API sảnh tiệc*
class WeddingLobbyPriceSerializer(ModelSerializer):
    class Meta:
        model = WeddingLobbyPrice
        fields = ['id', 'time', 'is_weekend', 'price', ]


class WeddingLobbySerializer(ModelSerializer):
    class Meta:
        model = WeddingLobby
        fields = ['id', 'name']


class WeddingLobbyDetailsSerializer(WeddingLobbySerializer):
    wedding_lobby_prices = WeddingLobbyPriceSerializer(many=True, read_only=True)
    image = SerializerMethodField()

    class Meta:
        model = WeddingLobbySerializer.Meta.model
        fields = WeddingLobbySerializer.Meta.fields + ['image', 'location', 'capacity', 'description', 'wedding_lobby_prices']

    def get_image(self, lobby):
        request = self.context['request']
        name = lobby.image.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = '/static/%s' % name

        return request.build_absolute_uri(path)


# API menu-drink*
class MenuDrinkSerializer(ModelSerializer):
    image = SerializerMethodField()

    class Meta:
        model = MenuDrink
        fields = ['id', 'name', 'price', 'image', 'unit']

    def get_image(self, drink):
        request = self.context['request']
        name = drink.image.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = '/static/%s' % name

        return request.build_absolute_uri(path)


# API menu-food*


class MenuFoodSerializer(ModelSerializer):
    image = SerializerMethodField()

    def get_image(self, food):
        request = self.context['request']
        name = food.image.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = '/static/%s' % name

        return request.build_absolute_uri(path)

    class Meta:
        model = MenuFood
        fields = ['id', 'name', 'price', 'image', 'food_type']


class MenuFoodDetailSerializer(MenuFoodSerializer):
    class Meta:
        model = MenuFoodSerializer.Meta.model
        fields = MenuFoodSerializer.Meta.fields + ['description', 'is_vegetarian']


class FoodTypeSerializer(ModelSerializer):
    menu_foods = MenuFoodSerializer(many=True, read_only=True)

    class Meta:
        model = FoodType
        fields = ['id', 'name', 'menu_foods']


# API Service

class ServiceSerializer(ModelSerializer):
    image = SerializerMethodField()

    def get_image(self, service):
        request = self.context['request']
        name = service.image.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = '/static/%s' % name

        return request.build_absolute_uri(path)

    class Meta:
        model = Service
        fields = ['id', 'name', 'price', 'image', 'service_type']


class ServiceTypeSerializer(ModelSerializer):
    services = ServiceSerializer(many=True, read_only=True)

    class Meta:
        model = ServiceType
        fields = ['id', 'name', 'event_type', 'services']

