//
//  UpdateImageView.swift
//  ImageEditDemo
//
//  Created by jht2 on 3/3/22.
//

import SwiftUI

struct UpdateImageView: View {
  var item:ItemModel
  @State var urlStr:String = ""
  @State var label:String = ""
  @State var assetName:String = ""
  @State var systemName:String = ""
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var document:Document
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
        Image(systemName: item.systemName)
          .resizable()
          .aspectRatio(contentMode: .fit)
      }
      Form {
        TextField("url", text: $urlStr)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        TextField("label", text: $label)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        TextField("assetName", text: $assetName)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        TextField("systemName", text: $systemName)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        HStack {
          Button("Update") {
            print("UpdateImageView Update")
            document.updateItem(id: item.id, urlStr: urlStr, label: label,
                                assetName: assetName, systemName: systemName)
            dismiss()
          }
          Spacer()
          Button("Cancel") {
            print("AddImageView Cancel")
            dismiss()
          }
          Spacer()
        }.padding()

      }
    }
  }
}

//struct UpdateImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateImageView()
//    }
//}
