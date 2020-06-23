//
//  GameViewController.swift
//  PassionChallenge
//
//  Created by Lívia Silva Oliveira on 18/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
class PastelScene: SKScene{
    override func didMove(to view: SKView) {
        let backgroundPastel = SKSpriteNode(imageNamed: <#T##String#>)
        backgroundPastel.position = CGPoint()
    }
}

class NeonScene: SKScene {
    override func didMove(to view: SKView) {
        let backgroundNeon = SKSpriteNode(imageNamed: <#T##String#>)
        backgroundNeon.position = CGPoint()
    }
}
let navigation = UINavigationController(rootViewController: MenuViewController())
