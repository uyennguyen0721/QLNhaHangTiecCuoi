import json
import datetime
from django import forms
from django.contrib import admin
from django.db.models import Count
from django.http import JsonResponse
from django.shortcuts import render
from django.template.response import TemplateResponse
from django.urls import path
from django.utils.safestring import mark_safe

from .models import *


# Register your models here.


# CHANGE ADMIN SITE

class NhaHangTiecCuoiAppAdminSite(admin.AdminSite):
    site_header = 'GLORIAN RESTAURANT'
    site_title = 'Glorian Admin'

    def get_urls(self):
        return [
                   path('glorian-stats/', self.glorian_stats)
               ] + super().get_urls()

    def glorian_stats(self, request):
        count = FoodType.objects.count()
        stats = FoodType.objects.annotate(food_count=Count('menu_foods')).values('id', 'name', 'food_count')
        return TemplateResponse(request, 'admin/glorian-stats.html', {
            'food_count': count,
            'food_stats': stats
        })


admin_site = NhaHangTiecCuoiAppAdminSite(name='BTL đề 4 môn CN LTHĐ')


# OVERRIDE FORM CREATE A USER TO SET PASSWORD

class CreatedUserForm(forms.ModelForm):
    def save(self, commit=True):
        user = super(CreatedUserForm, self).save(commit=False)
        user.set_password(self.cleaned_data["password"])
        if commit:
            user.save()
        return user


# USER ADMIN

class UserAdmin(admin.ModelAdmin):
    form = CreatedUserForm
    list_display = ['id', 'last_name', 'first_name', 'email', 'is_staff', 'is_superuser', 'is_active',
                    'date_joined', 'phone', 'address']
    search_fields = ['first_name', 'last_name', 'address', 'phone']
    list_filter = ['first_name', 'last_name']
    readonly_fields = ['image_avatar']

    def image_avatar(self, user):
        if user:
            return mark_safe('<img src="/static/{img_url}" width="120" alt={alt} />'.format(img_url=user.avatar.name,
                                                                                            alt=user.first_name))


# FEEDBACK ADMIN

class FeedbackAdmin(admin.ModelAdmin):
    list_display = ['id', 'created_date', 'updated_date', 'content', 'user']
    search_fields = ['user']
    list_filter = ['content', 'user']


# RATING ADMIN

class RatingAdmin(admin.ModelAdmin):
    list_display = ['id', 'created_date', 'updated_date', 'rate', 'user']
    search_fields = ['user']
    list_filter = ['user', 'rate']


# PAYMENT METHOD ADMIN

class PaymentMethodAdmin(admin.ModelAdmin):
    list_display = ['id', 'name']
    search_fields = ['name']
    list_filter = ['name']


# INVOICE ADMIN

class FoodBillInlineAdmin(admin.StackedInline):
    model = FoodBillDetail
    fk_name = 'invoice'


class DrinkBillInlineAdmin(admin.StackedInline):
    model = DrinkBillDetail
    fk_name = 'invoice'


class ServiceBillInlineAdmin(admin.StackedInline):
    model = ServiceBillDetail
    fk_name = 'invoice'


class InvoiceAdmin(admin.ModelAdmin):
    list_display = ['id', 'party_name', 'table_quantity', 'rental_date', 'totalBill', 'user']
    search_fields = ['user', 'party_name']
    list_filter = ['party_name', 'user', 'rental_date']
    inlines = [FoodBillInlineAdmin, DrinkBillInlineAdmin, ServiceBillInlineAdmin, ]
    ordering = ("-rental_date", )


# WEDDING LOBBY ADMIN

class WeddingLobbyPriceInlineAdmin(admin.StackedInline):
    model = WeddingLobbyPrice
    fk_name = 'wedding_lobby'


class WeddingLobbyPriceAdmin(admin.ModelAdmin):
    list_display = ['id', 'wedding_lobby', 'price']
    search_fields = ['wedding_lobby__name', 'wedding_lobby__capacity', 'price']
    list_filter = ['price']


class WeddingLobbyAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'location', 'capacity']
    search_fields = ['name', 'capacity']
    list_filter = ['name', 'location']
    readonly_fields = ['avatar']
    inlines = [WeddingLobbyPriceInlineAdmin, ]

    def avatar(self, wedding_lobby):
        if wedding_lobby:
            return mark_safe('<img src="/static/{img_url}" width="120" alt={alt} />'.format(img_url=wedding_lobby.image.name, alt=wedding_lobby.name))


# MENU FOOD ADMIN

class MenuFoodInlineAdmin(admin.StackedInline):
    model = MenuFood
    fk_name = 'food_type'


class FoodTypeAdmin(admin.ModelAdmin):
    list_display = ['id', 'name']
    inlines = [MenuFoodInlineAdmin, ]


class MenuFoodAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'active', 'food_type']
    search_fields = ['name', 'price']
    list_filter = ['name']
    readonly_fields = ['avatar']

    def avatar(self, menu_food):
        if menu_food:
            return mark_safe(
                '<img src="/static/{img_url}" width="120" alt={alt} />'.format(img_url=menu_food.image.name,
                                                                               alt=menu_food.name))


# MENU DRINK ADMIN

class MenuDrinkAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'active']
    search_fields = ['name', 'price']
    list_filter = ['name']
    readonly_fields = ['avatar']

    def avatar(self, menu_drink):
        if menu_drink:
            return mark_safe(
                '<img src="/static/{img_url}" width="120" alt={alt} />'.format(img_url=menu_drink.image.name,
                                                                               alt=menu_drink.name))


# SERVICE ADMIN

class ServiceInlineAdmin(admin.StackedInline):
    model = Service
    fk_name = 'service_type'


class ServiceTypeAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'event_type']
    inlines = [ServiceInlineAdmin, ]


class ServiceAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'active']
    search_fields = ['name', 'price']
    list_filter = ['name']
    readonly_fields = ['avatar']

    def avatar(self, service):
        if service:
            return mark_safe(
                '<img src="/static/{img_url}" width="120" alt={alt} />'.format(img_url=service.image.name,
                                                                               alt=service.name))


# REPORT ADMIN

class ReportAdmin(admin.ModelAdmin):

    def year_chart(self, request):
        labels = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9',
                  'Tháng 10', 'Tháng 11', 'Tháng 12']
        Jan = 0
        Feb = 0
        Mar = 0
        Apr = 0
        May = 0
        Jun = 0
        Jul = 0
        Aug = 0
        Sep = 0
        Oct = 0
        Nov = 0
        Dec = 0

        if request.method == 'POST':
            getYear = request.form.get('thang')
            count = Invoice.objects.all()
            for temp in count:
                year = datetime.datetime.strptime(temp['rental_date'], "%Y/%m/%d %H:%M:%S").year
                if year == getYear:
                    month = datetime.datetime.strptime(temp['rental_date'], "%Y/%m/%d %H:%M:%S").month

                    if month == 1:
                        Jan += temp['totalBill']
                    elif month == 2:
                        Feb += temp['totalBill']
                    elif month == 3:
                        Mar += temp['totalBill']
                    elif month == 4:
                        Apr += temp['totalBill']
                    elif month == 5:
                        May += temp['totalBill']
                    elif month == 6:
                        Jun += temp['totalBill']
                    elif month == 7:
                        Jul += temp['totalBill']
                    elif month == 8:
                        Aug += temp['totalBill']
                    elif month == 9:
                        Sep += temp['totalBill']
                    elif month == 10:
                        Oct += temp['totalBill']
                    elif month == 11:
                        Nov += temp['totalBill']
                    else:
                        Dec += temp['totalBill']

        data = [Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec]

        return JsonResponse(data={
            'labels': labels,
            'data': data,
        })

    def month_chart(self, request):
        get_month = request.form.get('thang')
        get_year = request.form.get('nam')
        turnover = 0
        count = Invoice.objects.all()
        for temp in count:
            year = datetime.datetime.strptime(temp['rental_date'], "%Y/%m/%d %H:%M:%S").year
            month = datetime.datetime.strptime(temp['rental_date'], "%Y/%m/%d %H:%M:%S").month
            if year == get_year and month == get_month:
                turnover += temp['totalBill']

        return turnover


admin_site.register(User, UserAdmin)
admin_site.register(Feedback, FeedbackAdmin)
admin_site.register(Rating, RatingAdmin)
admin_site.register(WeddingLobby, WeddingLobbyAdmin)
admin_site.register(WeddingLobbyPrice, WeddingLobbyPriceAdmin)
admin_site.register(MenuFood, MenuFoodAdmin)
admin_site.register(FoodType, FoodTypeAdmin)
admin_site.register(MenuDrink, MenuDrinkAdmin)
admin_site.register(Service, ServiceAdmin)
admin_site.register(ServiceType, ServiceTypeAdmin)
admin_site.register(Invoice, InvoiceAdmin)
admin_site.register(PaymentMethod, PaymentMethodAdmin)
