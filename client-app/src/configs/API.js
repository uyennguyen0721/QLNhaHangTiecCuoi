import axios from "axios";

export let endpoints = {
    'wedding_lobbies': '/wedding_lobbies/',
    'wedding_lobbies-detail': (lobbyId) => `/wedding_lobbies/${lobbyId}/`,
    'menu_drinks' : '/menu_drinks/',
    'food_type' : '/food_type/',
    'food_type_foods': (food_typeId) =>  `/food_type/${food_typeId}/foods/`,
    'menu_foods_detail': (foodId) => `/menu_foods/${foodId}/`,
    'menu_foods': '/menu_foods/',
    'wedding_event': '/wedding_event/',
    'conference_event': '/conference_event/',
    'birthday_event': '/birthday_event/',
    "oauth2-info": "/oauth2-info/",
    "login": "/o/token/",
    "current-user": "/users/current-user/",
    "register": "/users/",
}

export default axios.create({
    baseURL: 'http://127.0.0.1:8000/'
})