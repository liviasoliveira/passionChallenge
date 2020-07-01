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

class CustomizationScene: SKScene{
    let customizationScene = SKScene(size: CGSize(width: 480, height: 320))
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HUD1")
    let okButton = SKSpriteNode()
    let okText = SKLabelNode(fontNamed: "AvenirNext-Heavy")
    let backgroundImageC = SKSpriteNode(imageNamed: "ceuNeon")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        backgroundImageC.size = CGSize(width: 1024, height: 768)
        backgroundImageC.zPosition = -1
        self.addChild(backgroundImageC)
        
        okButton.texture = textureAtlas.textureNamed("button")
        okButton.name = "OkBtn"
        okButton.size = CGSize(width: 295, height: 76)
        okButton.zPosition = 1
        okButton.position = CGPoint(x: frame.midX, y: -100)
        self.addChild(okButton)
        
        okText.text = "Ok"
        okText.verticalAlignmentMode = .center
        okText.position = CGPoint(x: 0, y: -60)
        okText.fontSize = 40
        okText.name = "OkBtn"
        okText.zPosition = 5
        okButton.addChild(okText)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches){
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            if nodeTouched.name == "OkBtn"{
                self.view?.presentScene(Story1Scene(size: self.size))
                
            }
        }
        
        
    }
    
    //UIViewController {
    //    override func loadView() {
    //          let view = UIView()
    //          view.backgroundColor = .blue
    //
    //          let confirmButton = UIButton(frame: CGRect(x: 60, y: 400, width: 250, height: 100))
    //          confirmButton.setTitle("Exibir GameViewController", for: .normal)
    //          //confirmButton.addTarget(nil, action: #selector(tapplayButton), for: .touchUpInside)
    //
    //          view.addSubview(confirmButton)
    //          self.view = view
    //      }
    //
    //      @objc func tapButton() {
    //          print("Apertou botão da SecondViewController")
    //          show(GameViewController(), sender: nil)
    //      }
    //    public let customicationViewController = CustomizationViewController()
}
