//
//  ViewController.swift
//  Example
//
//  Created by David Keegan on 12/26/16.
//  Copyright © 2016 David Keegan. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    lazy var shaderView: ShaderView = {
        let view = ShaderView()
        view.shader = SKShader(shaderNamed: "shader")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.shaderView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.shaderView.frame = self.view.bounds
    }

}

