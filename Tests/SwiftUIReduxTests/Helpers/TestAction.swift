import Foundation
@testable import SwiftUIRedux

enum TestAction: Action {
    case increment
}

enum TestAsyncAction: AsyncAction {
    case asyncIncrement
    
    func async(dispatch: @escaping (Action) -> Void, state: State?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            dispatch(TestAction.increment)
        }
    }
}
