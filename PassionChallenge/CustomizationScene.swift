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

class CustomizationScene: SKScene, UITextFieldDelegate{
    let myField = UITextField(frame: CGRect(x:UIScreen.main.bounds.size.width * 0.4, y:UIScreen.main.bounds.size.height * 0.35, width:200, height:30))
    //    let myPickOptions = ["One", "Two", "Three"]
    //    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
    //        return 1
    //    }
    //
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    //        return myPickOptions.count
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        return myPickOptions[row]
    //    }
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        myField.text = "\(myPickOptions[row])"
    //        self.view?.endEditing(true)
    //    }
    
    
    
    
    
    
    let customizationScene = SKScene(size: CGSize(width: 733, height: 414))
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HUD1")
    let okButton = SKSpriteNode()
    let eleButton = SKSpriteNode()
    let elaButton = SKSpriteNode()
    let elosButton = SKSpriteNode()
    let okText = SKLabelNode(fontNamed: "SF Compact Display")
    let backgroundImageC = SKSpriteNode(imageNamed: "CustomizationImage")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        
        //        let genderPickerView  : UIPickerView = UIPickerView()
        //myField.inputView =
        myField.font = UIFont.systemFont(ofSize: 15)
        myField.borderStyle = UITextField.BorderStyle.roundedRect
        //        genderPickerView.dataSource = self
        //        genderPickerView.delegate = self
        myField.delegate = self
        self.view!.addSubview(myField)
        
        
        backgroundImageC.size = CGSize(width: 733, height: 414)
        backgroundImageC.zPosition = -1
        self.addChild(backgroundImageC)
        
        //okButton.texture = textureAtlas.textureNamed("button")
        okButton.run(SKAction.setTexture(SKTexture.init(imageNamed: "Botaojogar")))
        okButton.name = "OkBtn"
        okButton.size = CGSize(width: 100, height: 53)
        okButton.zPosition = 0
        okButton.position = CGPoint(x: 240 , y: -150)
        self.addChild(okButton)
        
        okText.text = "Jogar"
        okText.verticalAlignmentMode = .center
        okText.position = CGPoint(x: 0, y: 0)
        okText.fontSize = 30
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
                myField.removeFromSuperview()
                changeScene()
            }
            
            
        }
        
        
    }
}
