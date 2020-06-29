//
//  CustomizationViewController.swift
//  PassionChallenge
//
//  Created by Ravena Amaral on 23/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import SpriteKit

class CustomizationScene: SKScene{
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HUD1")
//    override func didMove(to view: SKView) {
//
//        super.didMove(to: view)
//
//        self.backgroundColor = SKColor.darkGray
//    }
    let customizationScene = SKScene(size: CGSize(width: 480, height: 320))


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
//}
