import SwiftUI

public struct StoreConnector<S: ReduxState, V: View>: View {
    @EnvironmentObject
    var store: Store<S>
    let content: (S, @escaping Dispatch) -> V
    
    public var body: some View {
        content(store.state, store.dispatch(action:))
    }
}
