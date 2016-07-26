//
//  SKUniform+Float.swift
//  KGNSpriteKit
//
//  Created by David Keegan on 7/24/16.
//  Copyright © 2016 David Keegan. All rights reserved.
//

import SpriteKit

// Float[2]
extension SKUniform {
    
    public typealias Float2 = (x: Float, y: Float)
    
    public var float2: Float2 {
        set {
            if #available(iOS 10.0, *) {
                self.vectorFloat2Value = vector_float2(x: newValue.x, y: newValue.y)
            } else {
                self.floatVector2Value = GLKVector2Make(newValue.x, newValue.y)
            }
        }
        
        get {
            if #available(iOS 10.0, *) {
                return (self.vectorFloat2Value.x, self.vectorFloat2Value.y)
            } else {
                return (self.floatVector2Value.x, self.floatVector2Value.y)
            }
        }
    }
    
    public convenience init(name: String, float2 value: Float2) {
        if #available(iOS 10.0, *) {
            self.init(name: name, vectorFloat2: vector_float2(x: value.x, y: value.y))
        } else {
            self.init(name: name, float: GLKVector2Make(value.x, value.y))
        }
    }
    
}

// Float[3]
extension SKUniform {
    
    public typealias Float3 = (x: Float, y: Float, z: Float)
    
    public var float3: Float3 {
        set {
            if #available(iOS 10.0, *) {
                self.vectorFloat3Value = vector_float3(x: newValue.x, y: newValue.y, z: newValue.z)
            } else {
                self.floatVector3Value = GLKVector3Make(newValue.x, newValue.y, newValue.z)
            }
        }
        
        get {
            if #available(iOS 10.0, *) {
                return (self.vectorFloat3Value.x, self.vectorFloat3Value.y, self.vectorFloat3Value.z)
            } else {
                return (self.floatVector3Value.x, self.floatVector3Value.y, self.floatVector3Value.z)
            }
        }
    }
    
    public convenience init(name: String, float3 value: (x: Float, y: Float, z: Float)) {
        if #available(iOS 10.0, *) {
            self.init(name: name, vectorFloat3: vector_float3(x: value.x, y: value.y, z: value.z))
        } else {
            self.init(name: name, float: GLKVector3Make(value.x, value.y, value.z))
        }
    }
    
}

// Float[4]
extension SKUniform {
    
    public typealias Float4 = (x: Float, y: Float, z: Float, w: Float)
    
    public var float4: Float4 {
        set {
            if #available(iOS 10.0, *) {
                self.vectorFloat4Value = vector_float4(x: newValue.x, y: newValue.y, z: newValue.z, w: newValue.w)
            } else {
                self.floatVector4Value = GLKVector4Make(newValue.x, newValue.y, newValue.z, newValue.w)
            }
        }
        
        get {
            if #available(iOS 10.0, *) {
                return (self.vectorFloat4Value.x, self.vectorFloat4Value.y, self.vectorFloat4Value.z, self.vectorFloat4Value.w)
            } else {
                return (self.floatVector4Value.x, self.floatVector4Value.y, self.floatVector4Value.z, self.floatVector4Value.w)
            }
        }
    }
    
    public convenience init(name: String, float4 value: Float4) {
        if #available(iOS 10.0, *) {
            self.init(name: name, vectorFloat4: vector_float4(x: value.x, y: value.y, z: value.z, w: value.w))
        } else {
            self.init(name: name, float: GLKVector4Make(value.x, value.y, value.z, value.w))
        }
    }
    
}
