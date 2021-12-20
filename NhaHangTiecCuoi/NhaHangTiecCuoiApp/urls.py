from django.urls import path, include
from rest_framework.routers import DefaultRouter

from . import views
from .admin import admin_site


router = DefaultRouter()
router.register('users', views.UserViewSet, basename='user')
router.register('wedding_lobbies', views.WeddingLobbyViewSet, basename='lobby')
router.register('wedding_lobby_price', views.WeddingLobbyPriceViewSet, basename='lobby_price')
router.register('wedding_lobbies', views.MenuLobbyViewSet, basename='lobby')
router.register('menu_drinks', views.MenuDrinkViewSet, basename='drink')
router.register('menu_foods', views.MenuFoodViewSet, basename='food')
router.register('menu_foods', views.MenuFoodDetailViewSet, basename='food')
router.register('food_type', views.FoodTypeViewSet, basename='food_type')
router.register('service_type', views.ServiceTypeViewSet, basename='service_type')
router.register('services', views.ServiceViewSet, basename='service')
router.register('wedding_event', views.WeddingEventViewSet, basename='wedding_event')
router.register('conference_event', views.ConferenceEventViewSet, basename='conference_event')
router.register('birthday_event', views.BirthdayEventViewSet, basename='birthday_event')
router.register('feedback', views.FeedbackViewSet, basename='feedback')
router.register('rating', views.RatingViewSet, basename='rating')
router.register('party', views.InvoiceViewSet, basename='party')
router.register('payment_method', views.PaymentMethodViewSet, basename='payment_method')

urlpatterns = [
    path('admin/', admin_site.urls),
    path('', include(router.urls)),
    path('oauth2-info/', views.AuthInfo.as_view()),
    #path('', views.index, name="index"),
]
