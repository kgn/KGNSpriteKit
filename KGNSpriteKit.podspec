Pod::Spec.new do |spec|
  spec.name = 'KGNSpriteKit'
  spec.version = '0.1.4'
  spec.authors = {'David Keegan' => 'me@davidkeegan.com'}
  spec.homepage = 'https://github.com/kgn/KGNSpriteKit'
  spec.summary = 'KGNSpriteKit is a collection of helpful UIColor extensions.'  
  spec.source = {:git => 'https://github.com/kgn/KGNSpriteKit.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.platform = :ios, '8.0'
  spec.requires_arc = true
  spec.frameworks = 'UIKit'
  spec.source_files = 'Source/UIColor+Extension.swift'
end
