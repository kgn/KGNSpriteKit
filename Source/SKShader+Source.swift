//
//  SKShader+Source.swift
//  KGNSpriteKit
//
//  Created by David Keegan on 7/25/16.
//  Copyright © 2016 David Keegan. All rights reserved.
//

import SpriteKit

extension SKShader {
    
    public convenience init(shaderNamed filename: String, extension: String = "fsh") {
        let shaderPath = "\(Bundle.main.bundlePath)/\(filename).\(`extension`)"
        let source = (try? String(contentsOfFile: shaderPath)) ?? ""
        self.init(universalSource: source)
    }
    
    public convenience init(universalSource: String) {
        var source = universalSource
        #if arch(i386) || arch(x86_64) // simulator
            source = source.replacingOccurrences(of: "const", with: "constant")
        #endif
        self.init(source: source)
    }
    
}
