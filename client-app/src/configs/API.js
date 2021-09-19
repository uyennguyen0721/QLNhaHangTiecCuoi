import axios from "axios";

export let endpoints = {
    'wedding_lobbies': '/wedding_lobbies/',
    'wedding_lobbies-detail': (lobbyId) => `/wedding_lobbies/${lobbyId}/`,
    'menu_drinks' : '/menu_drinks/'
}

export default axios.create({
    baseURL: 'http://127.0.0.1:8000/'
})