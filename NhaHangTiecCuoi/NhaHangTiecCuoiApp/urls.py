from django.urls import path, include
from rest_framework.routers import DefaultRouter

from . import views
from .admin import admin_site


router = DefaultRouter()
router.register('users', views.UserViewSet, basename='user')
router.register('wedding_lobbies', views.WeddingLobbyViewSet, basename='lobby')
router.register('menu_drinks', views.MenuDrinkViewSet, basename='drink')
router.register('menu_foods', views.MenuFoodViewSet, basename='food')
router.register('food_types', views.FoodTypeViewSet, basename='food_type')
router.register('wedding_lobbies', views.MenuLobbyViewSet, basename='lobby')


urlpatterns = [
    path('admin/', admin_site.urls),
    path('', include(router.urls)),
    #path('', views.index, name="index"),
]
