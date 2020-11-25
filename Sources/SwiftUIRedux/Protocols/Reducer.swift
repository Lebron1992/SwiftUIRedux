public typealias Reducer<S: ReduxState> = (_ state: S, _ action: Action) -> S
