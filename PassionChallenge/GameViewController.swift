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
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        let menuScene = MenuScene()
//        let skView = self.view as! SKView
//        skView.ignoresSiblingOrder = true
//        menuScene.size = view.bounds.size
//        skView.presentScene(menuScene)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let menuScene = MenuScene()
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = true
        menuScene.size = view.bounds.size
        skView.presentScene(menuScene)
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
//        // including entities and graphs.
//        if let scene = GKScene(fileNamed: "MenuViewController") {
//            // Get the SKScene from the loaded GKScene
//            if let sceneNode = scene.rootNode as! MenuScene? {
//                // Copy gameplay related content over to the scene
//               // sceneNode.entities = scene.entities
//                //sceneNode.graphs = scene.graphs
//                // Set the scale mode to scale to fit the window
//                sceneNode.scaleMode = .aspectFill
//                // Present the scene
//                if let view = self.view as! SKView? {
//                    view.presentScene(sceneNode)
//                    view.ignoresSiblingOrder = true
//                    view.showsFPS = true
//                    view.showsNodeCount = true
//                }
//            }
//        }
//    }
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
            
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
