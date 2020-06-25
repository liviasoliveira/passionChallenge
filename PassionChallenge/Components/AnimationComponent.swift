import SpriteKit
import GameplayKit

class AnimationComponent: GKComponent {
    
    var cNode: CharacterNode?
    
    var walkAnimation: SKAction?
    var idleAnimation: SKAction?
    
    override init() {
        super.init()
        
        walkAnimation = SKAction(named: "walk")
        idleAnimation = SKAction(named: "idle")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        walkAnimation = SKAction(named: "walk")
        idleAnimation = SKAction(named: "idle")
        
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        if cNode == nil {
            if let nodeComponent = self.entity?.component(ofType: GKSKNodeComponent.self) {
                cNode = nodeComponent.node as? CharacterNode
            }
        }
        
        if cNode?.stateMachine?.currentState is NormalState {
            if (cNode?.grounded)! {
                if (cNode?.left)! || (cNode?.right)! {
                    if (cNode?.action(forKey: "walk") == nil) {
                        cNode?.removeAllActions()
                        cNode?.run(walkAnimation!, withKey: "walk")
                    }
                }else{
                    if (cNode?.action(forKey: "idle") == nil) {
                        cNode?.run(idleAnimation!, withKey: "idle")
                    }
                }
            }
        }
    }
}
