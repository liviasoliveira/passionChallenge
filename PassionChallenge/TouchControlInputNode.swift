//
//  TouchControlInputNode.swift
//  PassionChallenge
//
//  Created by Lívia Silva Oliveira on 18/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import SpriteKit

class TouchControlInputNode: SKSpriteNode{
    
    var alphaUnpressed : CGFloat = 0.5
    var alphaPressed : CGFloat = 0.9
    
    var pressedButtons = [SKSpriteNode]()
    
    let buttonRight = SKSpriteNode(imageNamed: "controleRight")
    let buttonLeft = SKSpriteNode(imageNamed: "controleLeft")
    let buttonJump = SKSpriteNode(imageNamed: "controlePulo")
    let background = SKSpriteNode(imageNamed: "controle")
    
    let buttonA = SKSpriteNode(texture: SKTexture(imageNamed: "controleA"))
    let buttonB = SKSpriteNode(texture: SKTexture(imageNamed: "controleB"))
    let buttonX = SKSpriteNode(texture: SKTexture(imageNamed: "controleC"))
    let buttonY = SKSpriteNode(texture: SKTexture(imageNamed: "controleD"))
    
    var InputDelegate : ControlnputDelegate?
    
    init(frame: CGRect){
        
        super.init(texture: nil, color: UIColor.clear, size: frame.size)
        
        setupControls(size: frame.size)
        isUserInteractionEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setupControls(size: CGSize){
        
        addButton(button: buttonJump, position: CGPoint(x: -(size.width) / 3, y: -size.height / 4 + 50), name: "up", scale: 2.0)
        
        addButton(button: buttonLeft, position: CGPoint(x: -(size.width / 3) - 50, y: -size.height / 4), name: "left", scale: 2.0)
        
        addButton(button: buttonRight, position: CGPoint(x: -(size.width / 3) + 50, y: -size.height / 4), name: "right", scale: 2.0)
        
        addButton(button: buttonX, position: CGPoint(x: (size.width / 3), y: -size.height / 4 - 50), name: "X", scale: 0.40)
        
        addButton(button: buttonY, position: CGPoint(x: (size.width / 3) - 50, y: -size.height / 4), name: "Y", scale: 0.40)
        
        addButton(button: buttonB, position: CGPoint(x: (size.width / 3), y: -size.height / 4 - 50), name: "B", scale: 0.40)
        
        addButton(button: buttonA, position: CGPoint(x: (size.width / 3), y: -size.height / 4 - 50), name: "A", scale: 0.40)
        
    }
    
    
    func addButton(button: SKSpriteNode, position: CGPoint, name: String, scale: CGFloat){
        button.position = position
        button.setScale(scale)
        button.name = name
        button.zPosition = 10
        button.alpha = alphaUnpressed
        self.addChild(button)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            
            let location = t.location(in: parent!)
            //para todos 7 os botões e controles
            for button in [buttonLeft, buttonRight, buttonJump, buttonA, buttonB, buttonX, buttonY]{
                
                if button.contains(location) && pressedButtons.firstIndex(of: button) == nil {
                    pressedButtons.append(button)
                    if (InputDelegate != nil) {
                        InputDelegate?.follow(command: button.name)
                        
                    }
                }
                
                if(pressedButtons.firstIndex(of: button) != nil){
                    button.alpha = alphaPressed
                } else{
                    button.alpha = alphaUnpressed
                    
                    
                    
                }
                
            }
            
        }
    
//        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
//            for t in touches{
//
//                let location = t.location(in: parent!)
//                let previousLocation = t.previousLocation(in: parent!)
//
//                for button in [buttonLeft, buttonRight, buttonJump, buttonA, buttonB, buttonX, buttonY]{
//                    //if i get off the button where i was before
//                    if button.contains(pressedButtons) && !button.contains(location){
//                        let index != nil do {
//                            pressedButtons.remove(at: index!)
//                            if (self.InputDelegate != nil){
//                                InputDelegate?.follow(command: command: <#String?#>"cancel \(String(describing: button.name!))*)
                            
                            }
                        }
//                    }
//
//                }
//            }
//        }
//
//    }
//
//}

