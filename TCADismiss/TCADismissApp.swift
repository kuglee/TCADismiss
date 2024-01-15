import ComposableArchitecture
import SwiftUI

@main struct TCADismissApp: App {
  let store = Store.init(initialState: .init(), reducer: { AppFeature()._printChanges() })

  var body: some Scene { WindowGroup { AppView(store: self.store) } }
}
