//
//  Bottle.swift
//  Aquatic
//
//  Created by Luca Angeletti on 11/03/23.
//

import SpriteKit

final class Bottle: SKNode {
    
    private let bottleSprite: SKSpriteNode
    
    init(textureAtlas: SKTextureAtlas) throws {
        self.bottleSprite = SKSpriteNode(texture: textureAtlas.textureNamed("Bottle"))
        super.init()
        try addMask(textureAtlas: textureAtlas)
        prepareSprite()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addMask(textureAtlas: SKTextureAtlas) throws {
        let maskTexture = textureAtlas.textureNamed("Mask")
        let mask = SKSpriteNode(texture: maskTexture)
        let maskPhysicsBody = SKPhysicsBody(texture: maskTexture, size: maskTexture.size())
        maskPhysicsBody.isDynamic = false
        mask.physicsBody = maskPhysicsBody
        mask.zPosition = 1
        mask.color = Colors.background
        mask.colorBlendFactor = 1
        addChild(mask)
    }
    
    private func prepareSprite() {
        bottleSprite.zPosition = -1
        addChild(bottleSprite)
    }

    func addBox(at location: CGPoint, textureAtlas: SKTextureAtlas) throws {
        guard let scene else { throw AppError.sceneShouldNotBeNil }
        let location = convert(location, from: scene)
        let box = try Box(textureAtlas: textureAtlas)
        box.position = location
        box.zPosition = 3
        addChild(box)
    }

    func isValid(location: CGPoint) throws -> Bool {
        guard let scene else { throw AppError.sceneShouldNotBeNil }
        return bottleSprite.contains(convert(location, from: scene))
    }
    
}
