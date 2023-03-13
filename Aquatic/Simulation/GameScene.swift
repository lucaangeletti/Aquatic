//
//  GameScene.swift
//  Aquatic
//
//  Created by Luca Angeletti on 11/03/23.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene {
    private var isFaucetOn: Bool = false
    private var userInputLocation: CGPoint?
    private let textureAtlas: SKTextureAtlas = .init(dictionary: [
        "Molecule": NSImage(named: "Molecule") as Any,
        "Bottle": NSImage(named: "Bottle") as Any,
        "Mask": NSImage(named: "Mask") as Any,
        "Box": NSImage(named: "Box") as Any,
    ])
    private let aqua: Aqua
    private let bottle: Bottle
    
    init(
        size: CGSize,
        backgroundColor: SKColor = Colors.background
    ) throws {
        let sceneFrame: CGRect = .init(origin: .zero, size: size)
        self.aqua = try .init(textureAtlas: textureAtlas, sceneFrame: sceneFrame)
        self.bottle = try .init(textureAtlas: self.textureAtlas)
        super.init(size: size)
        self.backgroundColor = backgroundColor
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        setupScene()
    }
    
    private func setupScene() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        aqua.zPosition = 0
        addChild(aqua)
        addChild(bottle)
        bottle.position.x = frame.midX
        bottle.position.y = frame.midY
    }
    
    override func mouseDown(with event: NSEvent) {
        isFaucetOn = true
        userInputLocation = convertPoint(fromView: event.locationInWindow)
    }

    override func mouseDragged(with event: NSEvent) {
        userInputLocation = convertPoint(fromView: event.locationInWindow)
    }

    override func mouseUp(with event: NSEvent) {
        isFaucetOn = false
    }
    
    override func rightMouseDown(with event: NSEvent) {
        let userInputLocation = convertPoint(fromView: event.locationInWindow)
        do {
            try bottle.addBox(at: userInputLocation, textureAtlas: textureAtlas)
        } catch {
            debugPrint(error)
        }
    }
    override func update(_ currentTime: TimeInterval) {
        guard
            let userInputLocation,
            isFaucetOn,
            let isValidLocation = try? bottle.isValid(location: userInputLocation),
            isValidLocation
        else { return }
        aqua.addDrop(at: userInputLocation)
    }
}
