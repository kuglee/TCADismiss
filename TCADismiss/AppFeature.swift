import SwiftUI

@Observable class AppFeatureState {
  var destination: DestinationState? = nil

  func buttonTapped() { self.destination = self.destination == nil ? DestinationState() : nil }
}

@Observable class DestinationState: Identifiable { let id = UUID() }

struct AppView: View {
  @Bindable var store: AppFeatureState

  var body: some View {
    Button("Test") { store.buttonTapped() }
      .popup(item: self.$store.destination.animation(.linear(duration: 2))) {
        DestinationView(store: $0)
      }
  }
}
