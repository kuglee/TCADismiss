import ComposableArchitecture
import SwiftUI

@Reducer public struct DestinationFeature {
  public init() {}

  @ObservableState public struct State: Equatable {}

  public enum Action { case noop }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .noop: return .none
      }
    }
  }
}

public struct DestinationView: View {
  let store: StoreOf<DestinationFeature>

  public init(store: StoreOf<DestinationFeature>) { self.store = store }

  public var body: some View { Text("DestinationFeature") }
}
