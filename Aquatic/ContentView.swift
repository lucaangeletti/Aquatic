//
//  ContentView.swift
//  Aquatic
//
//  Created by Luca Angeletti on 11/03/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {

    private static let size: CGSize = .init(width: 600, height: 850)
    
    private let scene: SKScene? = {
        do {
            let gameScene: GameScene = try GameScene(size: Self.size)
            gameScene.scaleMode = .aspectFit
            return gameScene
        } catch {
            debugPrint("Failed to initialize GameScene: \(error)")
            return nil
        }
    }()

    var body: some View {
        if let scene {
            SpriteView(scene: scene/*, debugOptions: [.showsFPS, .showsNodeCount, .showsPhysics]*/)
                .ignoresSafeArea()
                .frame(minWidth: Self.size.width, maxWidth: Self.size.width, minHeight: Self.size.height, maxHeight: Self.size.height)
        } else {
            Text("Error: Failed to initialize game scene")
                .foregroundColor(.red)
                .frame(minWidth: Self.size.width, maxWidth: Self.size.width, minHeight: Self.size.height, maxHeight: Self.size.height)
        }
    }
}
