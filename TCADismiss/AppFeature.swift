import ComposableArchitecture
import SwiftUI

@Reducer public struct AppFeature {
  public init() {}

  @ObservableState public struct State: Equatable { @Presents var destination: Destination.State? }

  public enum Action {
    case destination(PresentationAction<Destination.Action>)
    case buttonTapped
  }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .buttonTapped:
        state.destination = state.destination == nil ? .destinationFeature(.init()) : nil

        return .none
      case .destination: return .none
      }
    }
    .ifLet(\.$destination, action: \.destination) { Destination() }
  }

  @Reducer public struct Destination {
    @ObservableState public enum State: Equatable {
      case destinationFeature(DestinationFeature.State)
    }

    public enum Action { case destinationFeature(DestinationFeature.Action) }

    public var body: some ReducerOf<Self> {
      Scope(state: \.destinationFeature, action: \.destinationFeature) { DestinationFeature() }
    }
  }
}

public struct AppView: View {
  @Bindable var store: StoreOf<AppFeature>

  public init(store: StoreOf<AppFeature>) { self.store = store }

  public var body: some View {
    Button("Test") { self.store.send(.buttonTapped) }
      .popup(
        item: self.$store
          .scope(state: \.destination?.destinationFeature, action: \.destination.destinationFeature)
          .animation(.linear(duration: 2))
      ) { DestinationView(store: $0) }
  }
}
