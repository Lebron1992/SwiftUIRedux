public protocol Action { }

public protocol AsyncAction: Action {
  func async(dispatch: @escaping Dispatch, state: ReduxState?)
}
