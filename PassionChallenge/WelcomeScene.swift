//
//  WelcomeScene.swift
//  PassionChallenge
//
//  Created by Ravena Amaral on 01/07/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit
import UIKit

var nome = SKLabelNode(fontNamed: "SF Compact Display")

class WelcomeScene: SKScene {
    
    let backgroundImageW = SKSpriteNode(imageNamed: "WelcomeImage")
    let okButton = SKSpriteNode()
    let okText = SKLabelNode(fontNamed: "SF Compact Display")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
//        nome.text = "Os artefatos que conectam as comunidades e revivem nossas culturas estão espalhados pelo mundo, Leona."
//        "Encontre o ojus para criar novos caminhos. Estamos juntes!"
//        nome.verticalAlignmentMode = .center
//        nome.position = CGPoint(x: 100, y: 80)
//        nome.fontSize = 15
//        nome.zPosition = 1
//        nome.fontColor = UIColor.black
//        self.addChild(nome)
        
        backgroundImageW.size = CGSize(width: 733, height: 414)
        backgroundImageW.zPosition = -1
        self.addChild(backgroundImageW)
        
        okButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "MenuButton")))
        okButton.name = "OkBtn"
        okButton.size = CGSize(width: 100, height: 70)
        okButton.zPosition = 0
        okButton.position = CGPoint(x: 270, y: -145)
        self.addChild(okButton)
        
        okText.text = "OK"
        okText.fontColor = UIColor.white
        okText.verticalAlignmentMode = .center
        okText.position = CGPoint(x: 0, y: 0)
        okText.fontSize = 25
        okText.name = "OkBtn"
        okText.zPosition = 1
        okButton.addChild(okText)
    }
    func changeScene(){
        if let scene = GKScene(fileNamed: "GameScene") {
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! PastelScene? {
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneNode, transition: myTransition)
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches){
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            if nodeTouched.name == "OkBtn"{
                changeScene()
            }
            
            
        }
        
    }
    
}




