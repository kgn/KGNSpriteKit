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
        // Add a newline as the first line to make SpriteKit happy
        // syntax error: preprocessor command must not be preceded by any other statement in that line
        var source = "\n"+universalSource
        #if arch(i386) || arch(x86_64) // device
        #else // simulator
            source = source.replacingOccurrences(of: "const", with: "constant")
        #endif
        self.init(source: source)
    }
    
}
