//
//  ItemDetail.swift
//

import SwiftUI

struct ItemDetail: View {
  @EnvironmentObject var document:Document
  @Environment(\.dismiss) var dismiss
  var item:ItemModel
  var body: some View {
    VStack {
      ZStack {
        Image(item.assetName)
          .resizable()
          .aspectRatio(contentMode: .fit)
        if let uiImage = imageFor(string: item.urlStr) {
          Image(uiImage: uiImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
      }
      HStack {
        Text("url: ")
        Text(item.urlStr)
        Spacer()
      }
      HStack {
        Text("label: ")
        Text(item.label)
        Spacer()
      }
      HStack {
        Text("assetName: ")
        Text(item.assetName)
        Spacer()
      }
      Button("Delete") {
        document.deleteItem(id: item.id)
        dismiss();
      }
    }
  }
}

