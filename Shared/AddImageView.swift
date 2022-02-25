//
//  AddImageView.swift
//

import SwiftUI
import PhotosUI

struct AddImageView: View {
  @State var urlstr:String = ""
  @State var label:String = ""
  @State var assetName:String = ""
  @State var systemName:String = ""
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var document:Document
  var body: some View {
    VStack {
      HStack {
        Button("Add") {
          print("AddImageView Add")
          document.addItem(urlStr: urlstr, label: label,
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
  }
}

struct AddImageView_Previews: PreviewProvider {
  static var previews: some View {
    AddImageView()
  }
}

