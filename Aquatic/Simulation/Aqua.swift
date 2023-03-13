//
//  Aqua.swift
//  Aquatic
//
//  Created by Luca Angeletti on 11/03/23.
//

import SpriteKit

final class Aqua: SKEffectNode {

    private let textureAtlas: SKTextureAtlas
    private lazy var blur: SKEffectNode = {
        let effectNode = SKEffectNode()
        effectNode.filter = CIFilter(name: "CIGaussianBlur", parameters: ["inputRadius": 15])
        effectNode.shouldEnableEffects = true
        return effectNode
    }()

    init(textureAtlas: SKTextureAtlas, sceneFrame: CGRect) throws {
        self.textureAtlas = textureAtlas
        super.init()
        shouldEnableEffects = true
        let shader = SKShader(fileNamed: "Shader")
        shader.addUniform(SKUniform(name: "aqua_color", vectorFloat4: try Colors.aqua.vector))
        self.shader = shader
        addChild(blur)

        let topLeft: Molecule = .init(textureAtlas: textureAtlas)
        topLeft.position.x = sceneFrame.minX
        topLeft.position.y = sceneFrame.maxY
        blur.addChild(topLeft)
        topLeft.physicsBody?.isDynamic = false
        topLeft.setScale(0.1)
        
        
        let bottomRight: Molecule = .init(textureAtlas: textureAtlas)
        bottomRight.position.x = sceneFrame.maxX
        bottomRight.position.y = sceneFrame.minY
        blur.addChild(bottomRight)
        bottomRight.physicsBody?.isDynamic = false
        bottomRight.setScale(0.1)
        
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDrop(at location: CGPoint) {
        let molecule = Molecule(textureAtlas: textureAtlas)
        molecule.position = location
        blur.addChild(molecule)
    }
    
}
