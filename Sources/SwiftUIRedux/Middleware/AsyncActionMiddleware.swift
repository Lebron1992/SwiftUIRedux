public let asyncActionMiddleware: Middleware = { dispatch, getState in
    { next in
        { action in
            if let action = action as? AsyncAction {
                action.async(dispatch: dispatch, state: getState())
            }
            return next(action)
        }
    }
}
