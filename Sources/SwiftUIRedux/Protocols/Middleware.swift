public typealias Middleware = (
    _ dispatch: @escaping Dispatch,
    _ getState: @escaping () -> ReduxState?
) -> (@escaping Dispatch) -> Dispatch
