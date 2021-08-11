from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
from django.db.models import FloatField
from django.utils.translation import gettext_lazy as _


class User(AbstractUser):
    class Meta:
        db_table = 'user'

    phone = models.CharField(max_length=50, null=False)
    address = models.CharField(max_length=100, null=False)
    avatar = models.ImageField(upload_to='avatar/%Y/%m')


class Feedback(models.Model):
    class Meta:
        db_table = 'feedback'

    date = models.DateTimeField(auto_now_add=True)
    content = models.TextField(null=True, blank=True)
    rating = models.IntegerField(null=True)

    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)


class WeddingLobby(models.Model):
    class Meta:
        db_table = 'wedding_lobby'

    name = models.CharField(max_length=100, null=False, unique=True)
    image = models.ImageField(upload_to='lobby', null=True)
    location = models.IntegerField(null=False)
    capacity = models.IntegerField(null=False)

    def __str__(self):
        return self.name


class WeddingLobbyPrice(models.Model):
    class Meta:
        db_table = 'wedding_lobby_price'

    class Time(models.TextChoices):
        MORNING = 1, _('Morning')
        NOON = 2, _('Noon')
        EVENING = 3, _('Evening')

    time = models.IntegerField(choices=Time.choices)
    is_weekend = models.BooleanField(null=False)
    price = models.FloatField(null=False)

    wedding_lobby = models.ForeignKey(WeddingLobby, on_delete=models.CASCADE)


class ServiceType(models.Model):
    class Meta:
        db_table = 'service_type'

    class EventType(models.TextChoices):
        WEDDING = 1, _('Wedding')
        CONFERENCE = 2, _('Conference')

    name = models.CharField(max_length=100, null=False, unique=True)
    event_type = models.IntegerField(choices=EventType.choices)


class FoodType(models.Model):
    class Meta:
        db_table = 'food_type'

    name = models.CharField(max_length=100, null=False, unique=True)


class BaseModel(models.Model):
    class Meta:
        abstract = True

    name = models.CharField(max_length=255, null=False, unique=True)
    price = models.FloatField(null=False)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class MenuDrink(BaseModel):
    class Meta:
        db_table = 'menu_drink'

    image = models.ImageField(upload_to='drink', null=True)


class Service(BaseModel):
    class Meta:
        db_table = 'service'

    image = models.ImageField(upload_to='service', null=True)
    service_type = models.ForeignKey(ServiceType, on_delete=models.SET_NULL, null=True)


class MenuFood(BaseModel):
    class Meta:
        db_table = 'menu_food'

    description = models.TextField(null=True, blank=True)
    image = models.ImageField(upload_to='food', null=True)
    is_vegetarian = models.BooleanField(null=False)

    food_type = models.ForeignKey(FoodType, on_delete=models.SET_NULL, null=True)


class PaymentMethod(models.Model):
    class Meta:
        db_table = 'payment_method'

    name = models.CharField(max_length=100, null=False, unique=True)

    def __str__(self):
        return self.name


class Invoice(models.Model):
    class Meta:
        db_table = 'invoice'

    party_name = models.CharField(max_length=100, null=False)
    table_quantity = models.IntegerField(null=False)
    rental_date = models.DateTimeField(null=False)
    created_date = models.DateTimeField(auto_now_add=True)
    lobby_price = FloatField(null=False)
    totalBill = FloatField(null=False)

    wedding_lobby = models.ForeignKey(WeddingLobby, on_delete=models.SET_NULL, null=True)
    payment_method = models.ForeignKey(PaymentMethod, on_delete=models.SET_NULL, null=True)

    foods = models.ManyToManyField(MenuFood, related_name="invoice_foods", blank=True, null=True)
    drinks = models.ManyToManyField(MenuDrink, related_name="invoice_drinks", blank=True, null=True)
    services = models.ManyToManyField(Service, related_name="invoice_services", blank=True, null=True)
