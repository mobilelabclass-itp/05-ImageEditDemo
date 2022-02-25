//
//  ImageDemoApp.swift
//

import SwiftUI

@main
struct ImageDemoApp: App {
  
  @StateObject var document = Document()

    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(document)
          
        }
    }
}
