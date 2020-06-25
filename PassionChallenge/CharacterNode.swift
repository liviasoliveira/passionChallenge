//
//  CharacterNode.swift
//  PassionChallenge
//
//  Created by Lívia Silva Oliveira on 18/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import GameplayKit
import SpriteKit

class CharacterNode: SKSpriteNode{
    
    var left = false
    var right = false
    
    var jump = false
    var landed = false
    var grounded = false
    
    var maxJump: CGFloat = 40.0
    
    var airAccel: CGFloat = 0.1
    var airDecel: CGFloat = 0.0
    var groundAccel: CGFloat = 0.2
    var groundDecel: CGFloat = 0.5
    
    var facing: CGFloat = 1.0
    
    var hSpeed: CGFloat = 0.0
    
    var walkSpeed: CGFloat = 2
    
        var stateMachine: GKStateMachine?
    
        func setUpStateMachine(){
            let normalState = NormalState(with: self)
            stateMachine = GKStateMachine(states: [normalState])
            stateMachine?.enter(NormalState.self)
        }
    }
    

