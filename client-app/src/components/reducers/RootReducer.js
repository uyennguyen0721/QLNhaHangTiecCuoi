import { combineReducers } from "redux";
import lobbiesReducer from "./LobbiesReducer";
import ratingReducer from "./RatingReducer";
import userReducer from "./UserReducer"

const mainReducer = combineReducers({
    'user': userReducer,
    'rate': ratingReducer,
    'lobby': lobbiesReducer
})

export default mainReducer