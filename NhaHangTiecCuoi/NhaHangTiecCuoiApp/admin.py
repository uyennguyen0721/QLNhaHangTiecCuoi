from django.contrib import admin
from django.utils.safestring import mark_safe

from .models import User, Feedback, WeddingLobby, WeddingLobbyPrice, MenuFood, MenuDrink, Service, ServiceType, FoodType

# Register your models here.


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


admin.site.register(User)
admin.site.register(Feedback)
admin.site.register(WeddingLobby, WeddingLobbyAdmin)
admin.site.register(WeddingLobbyPrice, WeddingLobbyPriceAdmin)
admin.site.register(MenuFood, MenuFoodAdmin)
admin.site.register(FoodType, FoodTypeAdmin)
admin.site.register(MenuDrink, MenuDrinkAdmin)
admin.site.register(Service, ServiceAdmin)
admin.site.register(ServiceType, ServiceTypeAdmin)
