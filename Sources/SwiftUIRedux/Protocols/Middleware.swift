public typealias Middleware = (
    _ dispatch: @escaping Dispatch,
    _ getState: @escaping () -> State?
) -> (@escaping Dispatch) -> Dispatch
