//
//  SKShader+Source.swift
//  KGNSpriteKit
//
//  Created by David Keegan on 7/25/16.
//  Copyright © 2016 David Keegan. All rights reserved.
//

import SpriteKit

extension SKShader {
    
    // TODO: this doesn't seem to work in playgrounds
    public class func shader(fromFile fileNamed: String, fileExtension: String = "fsh") -> SKShader? {
        let mainBundlePath = Bundle.main.bundlePath
        let shaderPath = mainBundlePath+"/"+fileNamed+"."+fileExtension
        guard let source = try? String(contentsOfFile: shaderPath) else {
            return nil
        }
        return self.shader(fromSource: source)
    }
    
    public class func shader(fromSource source: String) -> SKShader {
        var universalSource = source
        #if arch(i386) || arch(x86_64)
            universalSource = universalSource.replacingOccurrences(of: "const", with: "constant")
        #endif
        return SKShader(source: universalSource)
    }
    
}
