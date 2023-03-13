//
//  ContentView.swift
//  Aquatic
//
//  Created by Luca Angeletti on 11/03/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {

    private let size: CGSize = .init(width: 600, height: 850)
    
    private var scene: SKScene? {
        do {
            let gameScene: GameScene = try GameScene(size: size)
            gameScene.scaleMode = .aspectFit
            return gameScene
        } catch {
            debugPrint("Failed to initialize GameScene: \(error)")
            return nil
        }
    }

    var body: some View {
        if let scene {
            SpriteView(scene: scene/*, debugOptions: [.showsFPS, .showsNodeCount, .showsPhysics]*/)
                .ignoresSafeArea()
                .frame(minWidth: size.width, maxWidth: size.width, minHeight: size.height, maxHeight: size.height)
        } else {
            Text("Error: Failed to initialize game scene")
                .foregroundColor(.red)
                .frame(minWidth: size.width, maxWidth: size.width, minHeight: size.height, maxHeight: size.height)
        }
    }
}
