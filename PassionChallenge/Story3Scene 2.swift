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
    let story3Scene = SKScene(size: CGSize(width: 480, height: 320))
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HUD1")
    let backgroundImageS3 = SKSpriteNode(imageNamed: "ceuNeon")
    let story3Text = SKLabelNode(fontNamed: "AvenirNext-Heavy")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        backgroundImageS3.size = CGSize(width: 1024, height: 768)
        backgroundImageS3.zPosition = -1
        self.addChild(backgroundImageS3)
        
        story3Text.text = "Texto história 3"
        story3Text.position = CGPoint(x: 0, y: 100)
        story3Text.fontSize = 60
        self.addChild(story3Text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for touch in (touches){
        //touchToBegin.run(SKAction.move(by: CGVector(dx: -50, dy: -100), duration: 0.5)){
        // self.touchToBegin.isHidden = true
        changeScene()
        //self.view?.presentScene()
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
}


