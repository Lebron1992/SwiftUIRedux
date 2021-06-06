import SwiftUI

public protocol ConnectedView: View {
    associatedtype StoreState: ReduxState
    associatedtype Props
    associatedtype V: View
    
    func map(state: StoreState, dispatch: Dispatch) -> Props
    func body(props: Props) -> V
}

extension ConnectedView {
    private func render(state: StoreState, dispatch: Dispatch) -> V {
        let props = map(state: state, dispatch: dispatch)
        return body(props: props)
    }

    public var body: StoreConnector<StoreState, V> {
        StoreConnector(content: render)
    }
}
