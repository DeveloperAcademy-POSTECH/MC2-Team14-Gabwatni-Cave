//
//  RainEffect.swift
//  HealingGame
//
//  Created by 이창형 on 2022/06/13.
//

import SwiftUI
import SpriteKit

struct RainEffect: View {
    var body: some View {

            
            GeometryReader{_ in
                SpriteView(scene: RainFall(), options: [.allowsTransparency])
            }
            .ignoresSafeArea()
            
        
    }
}
    
    
    class RainFall: SKScene{
        override func sceneDidLoad() {
            
            size = UIScreen.main.bounds.size
            scaleMode = .resizeFill
            
            anchorPoint = CGPoint(x:0.5, y:1)
            
            backgroundColor = .clear
            
            let node = SKEmitterNode(fileNamed: "MyParticle.sks")!
            addChild(node)
            
            node.particlePositionRange.dx = UIScreen.main.bounds.width
        }
    }
    
    class RainFallLanding: SKScene{
        override func sceneDidLoad() {
            
            size = UIScreen.main.bounds.size
            scaleMode = .resizeFill
            
            let height = UIScreen.main.bounds.height
            
            anchorPoint = CGPoint(x:0.5, y:(height-5) / height)
            
            backgroundColor = .clear
            
            let node = SKEmitterNode(fileNamed: "RainFallLanding.sks")!
            addChild(node)
            
            node.particlePositionRange.dx = UIScreen.main.bounds.width - 30
        }
    }
    
    
    struct RainEffect_Previews: PreviewProvider {
        static var previews: some View {
            RainEffect()
        }
    }

