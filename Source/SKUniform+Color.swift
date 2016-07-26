//
//  SKHelpers.swift
//  KGNSpriteKit
//
//  Created by David Keegan on 6/11/16.
//  Copyright © 2016 David Keegan. All rights reserved.
//

import SpriteKit

#if os(OSX)
public typealias NSUIColor = NSColor
#else
public typealias NSUIColor = UIColor
#endif

extension SKUniform {
    
    public var colorValue: NSUIColor {
        get {
            return self.toColor()
        }
        set {
            self.float4 = SKUniform.fromColor(newValue)
        }
    }
    
    private static func fromColor(_ color: NSUIColor) -> Float4 {
        let c = color.cgColor.components!
        if color.cgColor.numberOfComponents == 2 {
            return (Float(c[0]), Float(c[0]), Float(c[0]), Float(c[1]))
        }
        return (Float(c[0]), Float(c[1]), Float(c[2]), Float(c[3]))
    }
    
    private func toColor() -> NSUIColor {
        let red = CGFloat(self.floatVector4Value.r)
        let green = CGFloat(self.floatVector4Value.g)
        let blue = CGFloat(self.floatVector4Value.b)
        let alpha = CGFloat(self.floatVector4Value.a)
        return NSUIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(name: String, color: NSUIColor) {
        self.init(name: name, float4: SKUniform.fromColor(color))
    }
    
}
