
//  MenuViewController.swift
//  PassionChallenge
//
//  Created by Ravena Amaral on 23/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class MenuScene: SKScene{
    
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HUD")
    let menuScene = SKScene(size: CGSize(width: 480, height: 320))
    let playButton = SKSpriteNode()
    let playText = SKLabelNode(fontNamed: "SF Compact Display")
    //let logoText = SKLabelNode(fontNamed: "AvenirNext-Heavy")
    let backgroundImage = SKSpriteNode(imageNamed: "MenuBackground")
    //let odaraImage = SKSpriteNode(imageNamed: "menuAsset 2certo")
    
    override func didMove(to view: SKView) {
        //setupButton()
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        backgroundImage.size = CGSize(width: 733, height: 414)
        backgroundImage.zPosition = -1
        self.addChild(backgroundImage)
        
        //odaraImage.size = CGSize(width: 60, height: 60)
        //odaraImage.zPosition = 1
        //self.addChild(odaraImage)
        
//        logoText.text = "Odara"
//        logoText.position = CGPoint(x: 0, y: 100)
//        logoText.fontSize = 60
//        self.addChild(logoText)
        
        //playButton.texture = textureAtlas.textureNamed("button")
        playButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "BotaoConhecer")))
        playButton.name = "PlayBtn"
        playButton.size = CGSize(width: 295, height: 90)
        playButton.zPosition = 0
        playButton.position = CGPoint(x: frame.midX, y: -15)
        self.addChild(playButton)
        
        playText.text = "Conhecer"
        playText.fontColor = UIColor.black
        playText.verticalAlignmentMode = .center
        playText.position = CGPoint(x: 13, y: 0)
        playText.fontSize = 35
        playText.name = "PlayBtn"
        playText.zPosition = 1
        playButton.addChild(playText)
        
        
//        let pulseAction = SKAction.sequence([SKAction.fadeAlpha(to: 0.5, duration: 0.9), SKAction.fadeAlpha(to: 1, duration: 0.9)])
//        playText.run(SKAction.repeatForever(pulseAction))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches){
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            if nodeTouched.name == "PlayBtn"{
                self.view?.presentScene(Story1Scene(size: self.size))
                //changeScene()
                
            }
        }
        
        
    }
    
//    func changeScene(){
//        if let scene = GKScene(fileNamed: "GameScene") {
//            // Get the SKScene from the loaded GKScene
//            if let sceneNode = scene.rootNode as! PastelScene? {
//                // Copy gameplay related content over to the scene
//                sceneNode.entities = scene.entities
//                sceneNode.graphs = scene.graphs
//                // Set the scale mode to scale to fit the window
//                sceneNode.scaleMode = .aspectFill
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneNode, transition: myTransition)
//            }
//        }
//        //let sceneToMoveTo = PastelScene()
//    }
}

