//
//  DestiniApp.swift
//  Destini
//
//  Created by Алишер Алсейт on 27.10.2021.
//

import SwiftUI

@main
struct DestiniApp: App {
    @ObservedObject var model = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
