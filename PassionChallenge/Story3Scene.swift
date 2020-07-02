//
//  Story3Scene.swift
//  PassionChallenge
//
//  Created by Ravena Amaral on 29/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


class Story3Scene: SKScene{
    let story3Scene = SKScene(size: CGSize(width: 896, height: 414))
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HUD1")
    let backgroundImageS3 = SKSpriteNode(imageNamed: "S3Image")
    let avancarButton = SKSpriteNode()
    let avancarText = SKLabelNode(fontNamed: "SF Compact Display")
    //let story3Text = SKLabelNode(fontNamed: "AvenirNext-Heavy")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        backgroundImageS3.size = CGSize(width: 896, height: 414)
        backgroundImageS3.zPosition = -1
        self.addChild(backgroundImageS3)
        
        //        story3Text.text = "Texto história 3"
        //        story3Text.position = CGPoint(x: 0, y: 100)
        //        story3Text.fontSize = 60
        //        self.addChild(story3Text)
        
        avancarButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "MenuButton")))
        avancarButton.name = "AvancarBtn"
        avancarButton.size = CGSize(width: 120, height: 55)
        avancarButton.zPosition = 0
        avancarButton.position = CGPoint(x: frame.midX, y: -163)
        self.addChild(avancarButton)
        
        avancarText.text = "Avançar"
        avancarText.fontColor = UIColor.white
        avancarText.verticalAlignmentMode = .center
        avancarText.position = CGPoint(x: 0, y: 0)
        avancarText.fontSize = 20
        avancarText.name = "AvancarBtn"
        avancarText.zPosition = 1
        avancarButton.addChild(avancarText)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches){
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            if nodeTouched.name == "AvancarBtn"{
                self.view?.presentScene(CustomizationScene(size: self.size))
                //self.view?.presentScene()
            }
            
        }
        
}
}
