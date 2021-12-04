const initStates = {
    "rate": null
}

const ratingReducer = (state=initStates, action) => {
    switch (action.type) {
        case "GET_RATING":
            return {
                ...state,
                "rate": action.payload
            }
        default:
            return state
    }
}

export default ratingReducer