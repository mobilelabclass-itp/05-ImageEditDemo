//
//  UpdateImageView.swift
//  ImageEditDemo
//
//  Created by jht2 on 3/3/22.
//

import SwiftUI

struct UpdateImageView: View {
  var item:ItemModel
  @State var urlstr:String = ""
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
      HStack {
        Button("Update") {
          print("UpdateImageView Update")
          document.updateItem(id: item.id, urlStr: urlstr, label: label,
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
      Form {
        TextField("url", text: $urlstr)
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
      }
    }
    .onAppear {
      print("UpdateImageView appear")
      urlstr = item.urlStr
      label = item.label
      assetName = item.assetName
      systemName = item.systemName
    }
  }
}

//struct UpdateImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateImageView()
//    }
//}
