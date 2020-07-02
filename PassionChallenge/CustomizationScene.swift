//
//  CustomizationViewController.swift
//  PassionChallenge
//
//  Created by Ravena Amaral on 23/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import UIKit


var myField = UITextField(frame: CGRect(x:UIScreen.main.bounds.size.width * 0.27, y:UIScreen.main.bounds.size.height * 0.38, width: 160, height:30))
var nomeField: String!

class CustomizationScene: SKScene, UITextFieldDelegate{
    
    let customizationScene = SKScene(size: CGSize(width: 733, height: 414))
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HUD1")
    let setaButton = SKSpriteNode()
    let setaButton1 = SKSpriteNode()
    let okButton = SKSpriteNode()
    let eleButton = SKSpriteNode()
    let eleText = SKLabelNode(fontNamed: "SF Compact Display")
    let elaButton = SKSpriteNode()
    let elaText = SKLabelNode(fontNamed: "SF Compact Display")
    let elusButton = SKSpriteNode()
    let elusText = SKLabelNode(fontNamed: "SF Compact Display")
    let okText = SKLabelNode(fontNamed: "SF Compact Display")
    let backgroundImageC = SKSpriteNode(imageNamed: "CustomizationImage")
    let personagemImage = SKSpriteNode(imageNamed: "Personagem")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        nomeField = myField.text!
        
        
        myField.font = UIFont.systemFont(ofSize: 15)
        myField.borderStyle = UITextField.BorderStyle.roundedRect
        myField.delegate = self
        self.view!.addSubview(myField)
        
        
        backgroundImageC.size = CGSize(width: 733, height: 414)
        backgroundImageC.zPosition = -1
        self.addChild(backgroundImageC)
        
        personagemImage.size = CGSize(width: 190, height: 270)
        personagemImage.position = CGPoint(x: 130 , y: -18)
        personagemImage.zPosition = 2
        self.addChild(personagemImage)
        
        //okButton.texture = textureAtlas.textureNamed("button")
        setaButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "SetaImage")))
        setaButton.name = "SetaBtn"
        setaButton.size = CGSize(width: 15, height: 20)
        setaButton.zPosition = 0
        setaButton.position = CGPoint(x: 250 , y: 0)
        self.addChild(setaButton)
        
        setaButton1.run(SKAction.setTexture(SKTexture.init(imageNamed: "Seta1Image")))
        setaButton1.name = "SetaBtn"
        setaButton1.size = CGSize(width: 15, height: 20)
        setaButton1.zPosition = 0
        setaButton1.position = CGPoint(x: 10 , y: 0)
        self.addChild(setaButton1)
        
        eleButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "BotaoPronome")))
        eleButton.name = "EleBtn"
        eleButton.size = CGSize(width: 140, height: 62)
        eleButton.zPosition = 0
        eleButton.position = CGPoint(x: -125 , y: -18)
        self.addChild(eleButton)
        
        eleText.text = "Ele/Eles"
        eleText.verticalAlignmentMode = .center
        eleText.position = CGPoint(x: 0, y: 0)
        eleText.fontSize = 20
        eleText.name = "EleBtn"
        eleText.zPosition = 1
        eleText.fontColor = UIColor.black
        eleButton.addChild(eleText)
        
        elaButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "BotaoPronome")))
        elaButton.name = "ElaBtn"
        elaButton.size = CGSize(width: 140, height: 62)
        elaButton.zPosition = 0
        elaButton.position = CGPoint(x: -125 , y: -60)
        self.addChild(elaButton)
        
        elaText.text = "Ela/Elas"
        elaText.verticalAlignmentMode = .center
        elaText.position = CGPoint(x: 0, y: 0)
        elaText.fontSize = 20
        elaText.name = "ElaBtn"
        elaText.zPosition = 1
        elaText.fontColor = UIColor.black
        elaButton.addChild(elaText)
        
        elusButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "BotaoPronome")))
        elaButton.name = "ElusBtn"
        elusButton.size = CGSize(width: 140, height: 62)
        elusButton.zPosition = 0
        elusButton.position = CGPoint(x: -125 , y: -102)
        self.addChild(elusButton)
        
        elusText.text = "Elus"
        elusText.verticalAlignmentMode = .center
        elusText.position = CGPoint(x: 0, y: 0)
        elusText.fontSize = 20
        elusText.name = "ElusBtn"
        elusText.zPosition = 1
        elusText.fontColor = UIColor.black
        elusButton.addChild(elusText)
        
        
        
        okButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "MenuButton")))
        okButton.name = "JogarBtn"
        okButton.size = CGSize(width: 110, height: 65)
        okButton.zPosition = 0
        okButton.position = CGPoint(x: 270 , y: -145)
        self.addChild(okButton)
        
        okText.text = "Jogar"
        okText.verticalAlignmentMode = .center
        okText.position = CGPoint(x: 0, y: 0)
        okText.fontSize = 25
        okText.name = "JogarBtn"
        okText.zPosition = 1
        okButton.addChild(okText)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myField.resignFirstResponder()
        for touch in (touches){
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            if nodeTouched.name == "JogarBtn"{
                myField.removeFromSuperview()
                nome.text = nomeField
                self.view?.presentScene(WelcomeScene(size: self.size))
                
             
                
                
            }
            
            
        }
        
        
    }
}

