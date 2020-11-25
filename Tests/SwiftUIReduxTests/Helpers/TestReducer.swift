@testable import SwiftUIRedux

func testReducer(_ state: TestState, _ action: Action) -> TestState {
    guard let action = action as? TestAction else {
        return state
    }
    var state = state
    switch action {
    case .increment:
        state.count += 1
    }
    return state
}
