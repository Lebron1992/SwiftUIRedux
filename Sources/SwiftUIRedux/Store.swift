import Combine
import Foundation

public class Store<S: ReduxState>: ObservableObject {
   @Published public private(set) var state: S
    
    private let reducer: Reducer<S>
    private var dispatch: Dispatch!
    
    public init(
        initialState: S,
        reducer: @escaping Reducer<S>,
        middlewares: [Middleware] = [asyncActionMiddleware]
    ) {
        self.state = initialState
        self.reducer = reducer
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
        self.dispatch(action)
    }
    
    private func _dispatch(action: Action) {
        state = reducer(state, action)
    }
}
