import SpriteKit
import GameplayKit

struct ColliderType {
    static let PLAYER : UInt32 = 0x1 << 0
    static let GROUND : UInt32 = 0x1 << 1
    static let ITEM: UInt32 = 0x1 << 2
}

extension PastelScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == ColliderType.PLAYER | ColliderType.GROUND {
            if let player = contact.bodyA.node as? CharacterNode {
                player.grounded = true
            } else if let player = contact.bodyB.node as? CharacterNode {
                player.grounded = true
            }
        }
        
        let collisionItem: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        if collisionItem == ColliderType.PLAYER | ColliderType.ITEM {
            print("colidiu Ojus")
            self.view?.presentScene(ThanksScene(size: self.size))
        }
    }
}


