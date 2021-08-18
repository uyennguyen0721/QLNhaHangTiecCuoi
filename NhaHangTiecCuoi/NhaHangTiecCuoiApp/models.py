from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
from django.db.models import FloatField


class User(AbstractUser):
    class Meta:
        db_table = 'user'

    phone = models.CharField(max_length=50, null=False)
    address = models.CharField(max_length=100, null=False)
    avatar = models.ImageField(upload_to='img/avatar/%Y/%m')


class Feedback(models.Model):
    class Meta:
        db_table = 'feedback'

    date = models.DateTimeField(auto_now_add=True)
    content = models.TextField(null=True, blank=True)
    rating = models.IntegerField(null=True)

    user = models.ForeignKey(User, related_name='feedbacks', on_delete=models.SET_NULL, null=True)


class WeddingLobby(models.Model):
    class Meta:
        db_table = 'wedding_lobby'

    name = models.CharField(max_length=100, null=False, unique=True)
    image = models.ImageField(upload_to='img/lobby', null=True)
    location = models.IntegerField(null=False)
    capacity = models.IntegerField(null=False)
    description = models.TextField(null=True)

    def __str__(self):
        return self.name


class WeddingLobbyPrice(models.Model):
    class Meta:
        db_table = 'wedding_lobby_price'

    MORNING = 1
    NOON = 2
    EVENING = 3

    TIME_CHOICES = [
        (MORNING, 'Morning'),
        (NOON, 'Noon'),
        (EVENING, 'Evening'),
    ]

    time = models.IntegerField(choices=TIME_CHOICES)
    is_weekend = models.BooleanField(null=False)
    price = models.FloatField(null=False)

    wedding_lobby = models.ForeignKey(WeddingLobby, related_name='wedding_lobby_prices', on_delete=models.CASCADE)


class ServiceType(models.Model):
    class Meta:
        db_table = 'service_type'

    WEDDING = 1
    CONFERENCE = 2
    BIRTHDAY = 3

    EVENT_CHOICES = [
        (WEDDING, 'Wedding'),
        (CONFERENCE, 'Conference'),
        (BIRTHDAY, 'Birthday'),
    ]

    name = models.CharField(max_length=100, null=False, unique=True)
    event_type = models.IntegerField(choices=EVENT_CHOICES)


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

    image = models.ImageField(upload_to='img/drink', null=True)
    unit = models.CharField(max_length=50, null=True)


class Service(BaseModel):
    class Meta:
        db_table = 'service'

    image = models.ImageField(upload_to='img/service', null=True)

    service_type = models.ForeignKey(ServiceType, related_name='services', on_delete=models.SET_NULL, null=True)


class MenuFood(BaseModel):
    class Meta:
        db_table = 'menu_food'

    description = models.TextField(null=True, blank=True)
    image = models.ImageField(upload_to='img/food', null=True)
    is_vegetarian = models.BooleanField(null=False)

    food_type = models.ForeignKey(FoodType, related_name='menu_foods', on_delete=models.SET_NULL, null=True)


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

    wedding_lobby = models.ForeignKey(WeddingLobby, related_name="invoices_lobby", on_delete=models.SET_NULL, null=True)
    payment_method = models.ForeignKey(PaymentMethod, related_name="invoices_pay", on_delete=models.SET_NULL, null=True)

    foods = models.ManyToManyField(MenuFood, related_name="invoice_foods", blank=True, null=True)
    drinks = models.ManyToManyField(MenuDrink, related_name="invoice_drinks", blank=True, null=True, through="DrinkBillDetail")
    services = models.ManyToManyField(Service, related_name="invoice_services", blank=True, null=True)


class DrinkBillDetail(models.Model): #model trung gian
    class Meta:
        db_table = "drink_bill_detail"
    unit_price = models.FloatField(null=False)
    quantity = models.IntegerField(null=False)
    unit = models.CharField(max_length=50, null=False)

    menu_drink = models.ForeignKey(MenuDrink, on_delete=models.SET_NULL, null=True)
    invoice = models.ForeignKey(Invoice, on_delete=models.CASCADE)
