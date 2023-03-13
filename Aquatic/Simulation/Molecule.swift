//
//  Molecule.swift
//  Aquatic
//
//  Created by Luca Angeletti on 11/03/23.
//

import Foundation
import SpriteKit

class Molecule: SKSpriteNode {

    init(textureAtlas: SKTextureAtlas) {
        let texture = textureAtlas.textureNamed("Molecule")
        super.init(texture: texture, color: .clear, size: texture.size())
        let physicsBody = SKPhysicsBody(circleOfRadius: 6)
        physicsBody.restitution = 0.4
        physicsBody.friction = 0
        physicsBody.linearDamping = 0
        physicsBody.angularDamping = 0
        physicsBody.density = 0.3
        self.colorBlendFactor = 1
        self.color = Colors.aqua
        self.physicsBody = physicsBody
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
