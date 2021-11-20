import { combineReducers } from "redux";
import lobbiesReducer from "./LobbiesReducer";
import userReducer from "./UserReducer"

const mainReducer = combineReducers({
    'user': userReducer,
    'lobby': lobbiesReducer
})

export default mainReducer