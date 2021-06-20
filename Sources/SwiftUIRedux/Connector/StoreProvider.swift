import SwiftUI

public struct StoreProvider<S: ReduxState, V: View>: View {
  let store: Store<S>
  let content: () -> V

  public init(store: Store<S>, content: @escaping () -> V) {
    self.store = store
    self.content = content
  }

  public var body: some View {
    content().environmentObject(store)
  }
}
