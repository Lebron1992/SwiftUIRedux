public typealias Reducer<S: State> = (
    _ state: S,
    _ action: Action,
    _ environment: Environment?
) -> S
