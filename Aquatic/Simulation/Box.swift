//
//  Box.swift
//  Aquatic
//
//  Created by Luca Angeletti on 13/03/23.
//

import SpriteKit

final class Box: SKNode {
    
    private let sprite: SKSpriteNode
    
    init(textureAtlas: SKTextureAtlas) throws {
        let texture = textureAtlas.textureNamed("Box")
        sprite = SKSpriteNode(texture: texture)
        sprite.color = Colors.box
        sprite.colorBlendFactor = 1
        let physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody.density = 3
        sprite.physicsBody = physicsBody
        super.init()
        addChild(sprite)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
