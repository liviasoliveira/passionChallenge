//
//  Story2Scene.swift
//  PassionChallenge
//
//  Created by Ravena Amaral on 29/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


class Story2Scene: SKScene{
    let story2Scene = SKScene(size: CGSize(width: 896, height: 414))
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HUD1")
    let backgroundImageS2 = SKSpriteNode(imageNamed: "S2Image")
    //let story2Text = SKLabelNode(fontNamed: "AvenirNext-Heavy")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        backgroundImageS2.size = CGSize(width: 896, height: 414)
        backgroundImageS2.zPosition = -1
        self.addChild(backgroundImageS2)
        
//        story2Text.text = "Texto história 2"
//        story2Text.position = CGPoint(x: 0, y: 100)
//        story2Text.fontSize = 60
//        self.addChild(story2Text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for touch in (touches){
        self.view?.presentScene(Story3Scene(size: self.size))
            
}
}

