from django.urls import path, include
from rest_framework.routers import DefaultRouter

from . import views
from .admin import admin_site


router = DefaultRouter()
router.register('users', views.UserViewSet)
router.register('wedding_lobbies', views.WeddingLobbyViewSet)
router.register('menu_drinks', views.MenuDrinkViewSet)
router.register('menu_foods', views.MenuFoodViewSet)
router.register('food_types', views.FoodTypeViewSet)


urlpatterns = [
    path('admin/', admin_site.urls),
    path('', include(router.urls)),
    #path('', views.index, name="index"),
]
