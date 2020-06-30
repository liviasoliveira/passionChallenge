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
    var alphaPressed : CGFloat = 0.8
    
    var pressedButtons = [SKSpriteNode]()
    
    let buttonRight = SKSpriteNode(imageNamed: "BRight")
    let buttonLeft = SKSpriteNode(imageNamed: "BLeft")
    let buttonJump = SKSpriteNode(imageNamed: "BJump")
//    let background = SKSpriteNode(imageNamed: "controle")
    
//    let buttonA = SKSpriteNode(texture: SKTexture(imageNamed: "controleA"))
//    let buttonB = SKSpriteNode(texture: SKTexture(imageNamed: "controleB"))
//    let buttonX = SKSpriteNode(texture: SKTexture(imageNamed: "controleC"))
//    let buttonY = SKSpriteNode(texture: SKTexture(imageNamed: "controleD"))
    
    var InputDelegate : ControlInputDelegate?
    
    init(frame: CGRect){
        
        super.init(texture: nil, color: UIColor.clear, size: frame.size )
        
        setupControls(size: frame.size)
        isUserInteractionEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setupControls(size: CGSize){
        
        addButton(button: buttonJump, position: CGPoint(x: 650, y: -298), name: "controlePulo", scale: 1.0)
        
        addButton(button: buttonLeft, position: CGPoint(x: -670, y: -302), name: "controleLeft", scale: 0.9)
        
        addButton(button: buttonRight, position: CGPoint(x: -510, y: -302), name: "controleRight", scale: 0.9)
        
//        addButton(button: background, position: CGPoint(x: -(size.width / 2.5) + 50, y: -size.height / 2.5), name: "controle", scale: 2.0)
        
//        addButton(button: buttonX, position: CGPoint(x: (size.width / 3), y: -size.height / 4 - 50), name: "X", scale: 0.40)
//
//        addButton(button: buttonY, position: CGPoint(x: (size.width / 3) - 50, y: -size.height / 4), name: "Y", scale: 0.40)
//
//        addButton(button: buttonB, position: CGPoint(x: (size.width / 3), y: -size.height / 4 - 50), name: "B", scale: 0.40)
//
//        addButton(button: buttonA, position: CGPoint(x: (size.width / 3), y: -size.height / 4 - 50), name: "A", scale: 0.40)
//
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
            for button in [buttonLeft, buttonRight, buttonJump]{
                
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
        
        func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
            for t in touches{
                
                let location = t.location(in: parent!)
                let previousLocation = t.previousLocation(in: parent!)
                for button in [buttonLeft, buttonRight, buttonJump] {
                    if button.contains(previousLocation) || button.contains(location) {
                        let index = pressedButtons.firstIndex(of: button)
                        if index != nil {
                            pressedButtons.remove(at: index!)
                            if InputDelegate != nil {
                                InputDelegate?.follow(command: "cancel \(button.name!))")
                            }
                        }
                    }
                        
                    else if !button.contains(previousLocation) && button.contains(location) && pressedButtons.firstIndex(of: button) == nil {
                        pressedButtons.append(button)
                        if (InputDelegate != nil) {
                            InputDelegate?.follow(command: button.name!)
                        }
                    }
                    
                    if(pressedButtons.firstIndex(of: button) != nil){
                        button.alpha = alphaPressed
                    } else{
                        button.alpha = alphaUnpressed
                        
                    }
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchUp(touches, withEvent: event)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchUp(touches, withEvent: event)
    }
    
    func touchUp(_ touches: Set<UITouch>?, withEvent event: UIEvent?) {
        for touch in touches! {
            let location = touch.location(in: parent!)
            let previousLocation = touch.previousLocation(in: parent!)
            for button in [buttonLeft, buttonRight, buttonJump] {
                if button.contains(location) || button.contains(previousLocation) {
                    let index = pressedButtons.firstIndex(of: button)
                    if index != nil {
                        pressedButtons.remove(at: index!)
                        if InputDelegate != nil {
                            InputDelegate?.follow(command: "stop \(button.name!)")
                        }
                    }
                }
                
                if(pressedButtons.firstIndex(of: button) != nil){
                    button.alpha = alphaPressed
                } else{
                    button.alpha = alphaUnpressed
                    
                }
            }
        }
    }
}

