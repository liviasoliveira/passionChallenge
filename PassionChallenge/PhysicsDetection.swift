import SpriteKit
import GameplayKit

struct ColliderType {
    static let PLAYER : UInt32 = 0x1 << 0
    static let GROUND : UInt32 = 0x1 << 1
}

class PhysicsDetection : NSObject, SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == ColliderType.PLAYER | ColliderType.GROUND {
            if let player = contact.bodyA.node as? CharacterNode {
                player.grounded = true
            } else if let player = contact.bodyB.node as? CharacterNode {
                player.grounded = true
            }
        }
    }
}

