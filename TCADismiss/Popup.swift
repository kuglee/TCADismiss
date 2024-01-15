import SwiftUI

extension View {
  public func popup<Item: Identifiable, Content: View>(
    item: Binding<Item?>,
    @ViewBuilder content: @escaping (Item) -> Content
  ) -> some View {
    self.overlay {
      item.wrappedValue.map { itemValue in
        VStack {
          content(itemValue)
          Button("Dismiss") { item.wrappedValue = nil }
        }
        .frame(width: 200).border(.green).offset(y: -50)
      }
    }
  }
}
