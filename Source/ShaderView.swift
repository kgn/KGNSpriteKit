//
//  ShaderView.swift
//  KGNSpriteKit
//
//  Created by David Keegan on 6/3/16.
//  Copyright © 2016 David Keegan. All rights reserved.
//

import SpriteKit

private extension Selector {
    static let updateSize = #selector(ShaderView.updateSize)
}

open class ShaderView: SKView {
    
#if os(OSX)
    let screenScale = NSScreen.mainScreen()!.backingScaleFactor
    public var backgroundColor: NSColor? {
        get {
            return self.scene?.backgroundColor
        }
        set {
            let color = newValue ?? .clearColor()
            self.scene?.backgroundColor = color
            self.allowsTransparency = CGColorGetAlpha(color.CGColor) < 1
        }
    }
#else
    let screenScale = UIScreen.main.scale
    override open var backgroundColor: UIColor? {
        get {
            return self.scene?.backgroundColor
        }
        set {
            let color = newValue ?? .clear
            self.scene?.backgroundColor = color
            self.allowsTransparency = color.cgColor.alpha < 1
        }
    }
#endif
    
    open var shouldRasterize: Bool {
        get {
            return self.rasterNode.shouldRasterize
        }
        
        set {
            if self.rasterNode.shouldRasterize != newValue {
                self.rasterNode.shouldRasterize = newValue
            }
        }
    }
    
    open var shader: SKShader? {
        didSet {
            if self.shader == oldValue {
                return
            }
            
            self.shaderNode.shader = self.shader
            
            self.shader?.addUniform(self.spriteScale)
            self.shader?.addUniform(self.spritePixelSize)
            self.shader?.addUniform(self.spriteSize)
            self.shader?.addUniform(self.spriteAspectRatio)
        }
    }
    
    private var privateLastSize: CGSize?
    open var lastSize: CGSize? {
        return self.privateLastSize
    }
    
    private lazy var spriteScale = SKUniform(name: "c_sprite_scale", float: 0)
    private lazy var spritePixelSize = SKUniform(name: "c_sprite_pixel_size", float: 0)
    private lazy var spriteSize = SKUniform(name: "c_sprite_size", float2: (0, 0))
    private lazy var spriteAspectRatio = SKUniform(name: "c_sprite_aspect_ratio", float2: (0, 0))
    
    private lazy var rasterNode = SKEffectNode()
    private lazy var shaderNode: SKSpriteNode = {
        let node = SKSpriteNode()
        node.anchorPoint = CGPoint.zero
        return node
    }()
    
#if os(OSX)
    override public init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.setup()
    }
#else
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    
        self.updateSize()
    }
#endif
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    open func setup() {
        let scene = SKScene()
        scene.addChild(self.rasterNode)
        self.rasterNode.addChild(self.shaderNode)
        self.presentScene(scene)
 
        #if os(OSX)
        self.postsBoundsChangedNotifications = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: .updateSize, name: nil, object: nil)
        #endif
    }
    
    @objc fileprivate func updateSize() {
        if self.bounds.isEmpty {
            return
        }
        
        if self.bounds.size == self.lastSize {
            return
        }
        
        let x = Float(self.bounds.size.width)
        let y = Float(self.bounds.size.height)
        self.spriteSize.float2 = (x, y)
        
        let aspectX: Float = x > y ? x/y : 1
        let aspectY: Float = x < y ? y/x : 1
        self.spriteAspectRatio.float2 = (aspectX, aspectY)
        
        let scale = UIScreen.main.scale
        self.spriteScale.floatValue = Float(scale)
        
        self.spritePixelSize.floatValue = Float(1/min(x, y))
        
        self.scene?.size = self.bounds.size
        self.shaderNode.size = self.bounds.size
    }
    
}
