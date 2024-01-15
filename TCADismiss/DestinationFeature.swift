import SwiftUI

struct DestinationView: View {
  let store: DestinationState

  init(store: DestinationState) { self.store = store }

  var body: some View { Text("DestinationFeature") }
}
