import axios from "axios";

export let endpoints = {
    'wedding_lobbies': '/wedding_lobbies/',
    'wedding_lobbies-detail': (lobbyId) => `/wedding_lobbies/${lobbyId}/`,
    'wedding_lobby_price': '/wedding_lobby_price/',
    'menu_drinks' : '/menu_drinks/',
    'food_type' : '/food_type/',
    'food_type_foods': (food_typeId) =>  `/food_type/${food_typeId}/foods/`,
    'menu_foods_detail': (foodId) => `/menu_foods/${foodId}/`,
    'menu_foods': '/menu_foods/',
    'wedding_event': '/wedding_event/',
    'conference_event': '/conference_event/',
    'birthday_event': '/birthday_event/',
    'services': (serviceId) => `/service_type/${serviceId}/services/`,
    "oauth2-info": "/oauth2-info/",
    "login": "/o/token/",
    "current-user": "/users/current-user/",
    "register": "/users/",
    "update_user": (userId) => `/users/${userId}/`,
    "rating": "/rating/",
    "update_rating": (ratingId) => `/rating/${ratingId}/`,
    "add_comment": "/feedback/add_feedback/",
    "comments": "/feedback/",
    "payment_method": "/payment_method/",
    "invoice": "/party/",
    "book_party": "/party/book_party/",
    "book_food": "/party/book_foods/",
    "book_drink": "/party/book_drinks",
    "book_service": "/party/book_services"
}

export default axios.create({
    baseURL: 'http://127.0.0.1:8000/'
})