//
//  ThanksScene.swift
//  PassionChallenge
//
//  Created by Ravena Amaral on 29/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class ThanksScene: SKScene{
    let thanksScene = SKScene(size: CGSize(width: 896, height: 414))
    let menuButton = SKSpriteNode()
    let backgroundImageT = SKSpriteNode(imageNamed: "TImage")
    let menuText = SKLabelNode(fontNamed: "SF Compact Display")
    //let odaraImage = SKSpriteNode(imageNamed: "menuAsset 2certo")
    override func didMove(to view: SKView) {
        //setupButton()
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        backgroundImageT.size = CGSize(width: 896, height: 414)
        backgroundImageT.zPosition = -1
        self.addChild(backgroundImageT)
        
        menuButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "MenuButton")))
        menuButton.name = "MenuBtn"
        menuButton.size = CGSize(width: 120, height: 56)
        menuButton.zPosition = 0
        menuButton.position = CGPoint(x: 300, y: -145)
        self.addChild(menuButton)
        
        menuText.text = "Menu"
        menuText.fontColor = UIColor.white
        menuText.verticalAlignmentMode = .center
        menuText.position = CGPoint(x: 13, y: 0)
        menuText.fontSize = 20
        menuText.name = "MenuBtn"
        menuText.zPosition = 1
        menuButton.addChild(menuText)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches){
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            if nodeTouched.name == "MenuBtn"{
                self.view?.presentScene(MenuScene(size: self.size))
                //changeScene()
                
            }
        }
        
    }
}
