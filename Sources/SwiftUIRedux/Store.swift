import Combine
import Foundation

public final class Store<S: State>: ObservableObject {
   @Published public private(set) var state: S
    
    private let environment: Environment
    private let reducer: Reducer<S>
    private var dispatch: Dispatch!
    
    init(
        initialState: S,
        reducer: @escaping Reducer<S>,
        middlewares: [Middleware] = [],
        environment: Environment
    ) {
        self.state = initialState
        self.reducer = reducer
        self.environment = environment
        var middlewares = middlewares
        middlewares.append(asyncActionMiddleware)
        self.dispatch = middlewares
            .reversed()
            .reduce(
                { [weak self] in self?._dispatch(action: $0) },
                { dispatch, middleware in
                    middleware(
                        { [weak self] in self?.dispatch(action: $0) },
                        { [weak self] in self?.state }
                    )(dispatch)
                }
            )
    }
    
    public func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.dispatch(action)
        }
    }
    
    private func _dispatch(action: Action) {
        state = reducer(state, action, environment)
    }
}
