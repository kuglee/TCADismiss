import SwiftUI

@main struct TCADismissApp: App {
  let store = AppFeatureState()

  var body: some Scene { WindowGroup { AppView(store: self.store) } }
}
