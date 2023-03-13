//
//  AquaticApp.swift
//  Aquatic
//
//  Created by Luca Angeletti on 11/03/23.
//

import SwiftUI

@main
struct AquaticApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fixedSize()
        }.windowResizability(.contentSize)
    }
}
