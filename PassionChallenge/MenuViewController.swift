//
//  MenuViewController.swift
//  PassionChallenge
//
//  Created by Ravena Amaral on 23/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .orange
        
        let playButton = UIButton(frame: CGRect(x: 60, y: 100, width: 250, height: 100))
        playButton.setTitle("Exibir CustomizationViewController", for: .normal)
        playButton.addTarget(nil, action: #selector(tapplayButton), for: .touchUpInside)
        
        let optionsButton = UIButton(frame: CGRect(x: 70, y: 100, width: 250, height: 100))
        playButton.setTitle("Exibir OptionsViewController", for: .normal)
        playButton.addTarget(nil, action: #selector(tapplayButton), for: .touchUpInside)
        
        view.addSubview(playButton)
        view.addSubview(optionsButton)
        self.view = view
    }
    
    @objc func tapplayButton() {
        print("Apertou botão da MenuViewController")
        //show(secondViewController, sender: nil)
        present(CustomizationViewController(), animated: true, completion: nil)
    }
}
