const initStates = {
    "lobby": null
}

const lobbiesReducer = (state=initStates, action) => {
    switch (action.type) {
        case "GET_LOBBIES":
            return {
                ...state,
                "lobby": action.payload
            }
        default:
            return state
    }
}

export default lobbiesReducer