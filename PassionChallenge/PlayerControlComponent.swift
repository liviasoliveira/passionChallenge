//
//  PlayerControlComponent.swift
//  PassionChallenge
//
//  Created by Lívia Silva Oliveira on 18/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayerControlComponent: GKComponent, ControlInputDelegate {
    
    var touchControlNode : TouchControlInputNode? = nil
    var cNode: CharacterNode?
    func setupControls (camera: SKCameraNode, scene: SKScene){
        
        touchControlNode = TouchControlInputNode(frame: scene.frame)
        touchControlNode?.InputDelegate = self
        touchControlNode?.position = CGPoint.zero
        
        camera.addChild(touchControlNode!)
        
        if (cNode == nil) {
            if let nodeComponent = self.entity?.component(ofType: GKSKNodeComponent.self) {
                cNode = nodeComponent.node as? CharacterNode
            }
        }
        
    }
    
    func follow(command: String?){
        
        if (cNode != nil) {
            switch(command!) {
            case("left"):
                cNode?.left = true
            case "cancel left", "stop left":
                cNode?.left = false
            case "right":
                cNode?.right = true
            case "cancel right", "stop right":
                cNode?.right = false
            default: print("command: \(String(describing: command))")
                
            }
        }
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        cNode?.stateMachine?.update(deltaTime: seconds)
    }
    
}
