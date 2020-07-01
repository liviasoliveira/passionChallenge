//
//  Story1Scne.swift
//  PassionChallenge
//
//  Created by Ravena Amaral on 29/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


class Story1Scene: SKScene{
    let story1Scene = SKScene(size: CGSize(width: 480, height: 320))
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HUD1")
    let backgroundImageS1 = SKSpriteNode(imageNamed: "ceuNeon")
    let story1Text = SKLabelNode(fontNamed: "AvenirNext-Heavy")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        backgroundImageS1.size = CGSize(width: 1024, height: 768)
        backgroundImageS1.zPosition = -1
        self.addChild(backgroundImageS1)
        
        story1Text.text = "Texto história 1"
        story1Text.position = CGPoint(x: 0, y: 100)
        story1Text.fontSize = 60
        self.addChild(story1Text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for touch in (touches){
            //touchToBegin.run(SKAction.move(by: CGVector(dx: -50, dy: -100), duration: 0.5)){
               // self.touchToBegin.isHidden = true
               self.view?.presentScene(Story2Scene(size: self.size))
                //self.view?.presentScene()
            }
        
               
           }


