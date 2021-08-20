import axios from "axios";

export let endpoints = {
    'wedding_lobbies': '/wedding_lobbies'
}

export default axios.create({
    baseURL: 'http://127.0.0.1:8000/'
})