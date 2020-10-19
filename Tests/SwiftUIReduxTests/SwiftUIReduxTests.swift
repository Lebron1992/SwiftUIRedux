import XCTest
@testable import SwiftUIRedux

final class SwiftUIReduxTests: XCTestCase {
    
    var store: Store<TestState>!
    
    override func setUp() {
        super.setUp()
        store = Store<TestState>(initialState: TestState(), reducer: testReducer)
    }
    
    override func tearDown() {
        store = nil
        super.tearDown()
    }
    
    func testStore_initCorrectly() {
        XCTAssertEqual(store.state.count, 0)
    }
    
    func testStore_whenDispatchedSyncAction_stateChangedAsExpected() {
        // when
        store.dispatch(action: TestAction.increment)
        
        // then
        XCTAssertEqual(self.store.state.count, 1)
    }
    
    func testStore_whenDispatchedAsyncAction_stateChangedAsExpected() {
        // given
        let queue = DispatchQueue(label: "AsyncAction")

        // when
        queue.sync {
            store.dispatch(action: TestAsyncAction.asyncIncrement)
        }

        // then
        queue.asyncAfter(deadline: .now() + 2, execute: {
            XCTAssertEqual(self.store.state.count, 1)
        })
    }
    
    static var allTests = [
        ("testStore_initCorrectly", testStore_initCorrectly),
        ("testStore_whenDispatchedSyncAction_stateChangedAsExpected", testStore_whenDispatchedSyncAction_stateChangedAsExpected),
        ("testStore_whenDispatchedAsyncAction_stateChangedAsExpected", testStore_whenDispatchedAsyncAction_stateChangedAsExpected),
    ]
}
