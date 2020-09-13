public protocol Action { }

public protocol AsyncAction: Action {
    func async(dispatch: Dispatch, state: State?)
}
