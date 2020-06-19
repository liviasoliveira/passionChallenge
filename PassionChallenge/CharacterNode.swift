//
//  CharacterNode.swift
//  PassionChallenge
//
//  Created by Lívia Silva Oliveira on 18/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class CharacterNode: SKSpriteNode{
    
    var left = false
    var right = false
    
    var jump = false
    var landed = false
    var grounded = false
    
    
    var hSpeed: CGFloat = 0.0
    
    var walkSpeed: CGFloat = 2
    
    //    var stateMachine: GKComponent?
    //
    //
    //    func setUpStateMachine(){
    //        let normalState = NormalState(with: self)
    //        stateMachine = GKStateMachine(states: [normalState])
    //        stateMachine?.enter(NormalState.self)
    //    }
    //}
    
}
