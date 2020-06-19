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

    var touchControlNode : TouchControlInputNode?

    func setupControls (camera: SKCameraNode, scene: SKScene){

        touchControlNode = TouchControlInputNode(frame: scene.frame)
        touchControlNode?.inputDelegate = self
        touchControlNode?.position = CGPoint.zero


        camera.addChild(touchControlNode!)

    }

    func follow(command: String?){

        print("command: \(String(describing: command))")
    }


}
