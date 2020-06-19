//
//  NormalState.swift
//  PassionChallenge
//
//  Created by Lívia Silva Oliveira on 18/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import Foundation
import GameplayKit

class NormalState: GKState{
    
    var cNode: CharacterNode
    
    init(with node: CharacterNode){
        cNode = node
        
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        if cNode.left {
            cNode.hSpeed = cNode.walkSpeed
        } else if cNode.right{
            cNode.hSpeed = -cNode.walkSpeed
        } else{
           cNode.hSpeed = 0.0
        }
    
       cNode.position.x = cNode.position.x + cNode.hSpeed

    }
    
}
