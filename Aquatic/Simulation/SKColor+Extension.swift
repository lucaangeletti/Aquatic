//
//  SKColor+Extension.swift
//  Aquatic
//
//  Created by Luca Angeletti on 11/03/23.
//

import SpriteKit

extension SKColor {
    
    var vector: vector_float4 {
        get throws {
            guard let components = cgColor.components else { throw AppError.componentsShouldNotBeNil }
            guard components.count == 4 else { throw AppError.unexptectedNumberOfComponents }
            
            let floatComponents = components.map { Float($0) }
            let vector = vector_float4(floatComponents[0], floatComponents[1], floatComponents[2], 0.8)
            return vector
        }
    }

}

