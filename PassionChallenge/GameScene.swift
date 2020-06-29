//
//  GameScene.swift
//  PassionChallenge
//
//  Created by Lívia Silva Oliveira on 18/06/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String: GKGraph]()
    var lastUpdateTime: TimeInterval = 0
    var physicsDelegate = PhysicsDetection()
    var player: CharacterNode?
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    //variável para o sistema parallax
    var parallaxComponentSystem: GKComponentSystem<ParallaxComponent>?
    
    override func didMove(to view: SKView) {
        
        //Parralax
        if let theNuvem = childNode(withName: "Nuvem") {
            let entity = GKEntity()
            let nodeComponent : GKSKNodeComponent = GKSKNodeComponent(node:theNuvem)
            let component: ParallaxComponent = ParallaxComponent()
            component.layer = 7
            entity.addComponent(component)
            entity.addComponent(nodeComponent)
            entities.append(entity)
        }
        
        if let thePredios = childNode(withName: "Predio") {
            let entity = GKEntity()
            let nodeComponent : GKSKNodeComponent = GKSKNodeComponent(node:thePredios)
            let component: ParallaxComponent = ParallaxComponent()
            component.layer = 5
            entity.addComponent(component)
            entity.addComponent(nodeComponent)
            entities.append(entity)
        }
        
        if let thePlantas = childNode(withName: "Planta") {
            let entity = GKEntity()
            let nodeComponent : GKSKNodeComponent = GKSKNodeComponent(node:thePlantas)
            let component: ParallaxComponent = ParallaxComponent()
            component.layer = 3
            entity.addComponent(component)
            entity.addComponent(nodeComponent)
            entities.append(entity)
        }
        
        
        parallaxComponentSystem = GKComponentSystem.init(componentClass: ParallaxComponent.self)
        for entity in self.entities {
            parallaxComponentSystem?.addComponent(foundIn: entity)
        }
        
        for component in (parallaxComponentSystem?.components)! {
            component.prepareWith(camera: camera)
        }
        
        
        
        if let animationWalk = childNode(withName: "Player") {
            let entity = GKEntity()
            let nodeComponent: GKSKNodeComponent = GKSKNodeComponent(node:animationWalk)
            let component: AnimationComponent = AnimationComponent()
            entity.addComponent(component)
            entity.addComponent(nodeComponent)
            entities.append(entity)
        }
        
        
        if let thePlayer = childNode(withName: "Player") {
            player = thePlayer as? CharacterNode
            if (player != nil) {
                player?.setUpStateMachine()
               player?.creatPhysic()

            }
            let entity = GKEntity()
            let nodeComponent : GKSKNodeComponent = GKSKNodeComponent(node:thePlayer)
            let component: PlayerControlComponent = PlayerControlComponent()
            entity.addComponent(component)
            entity.addComponent(nodeComponent)
            entities.append(entity)
            component.setupControls(camera: camera!, scene: self)
        }
        
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
        
        if let tilemap = childNode(withName: "Plataformas") as? SKTileMapNode {
            giveTileMapPhysicsBody(map: tilemap)
        }
        
        self.physicsWorld.contactDelegate = physicsDelegate
    }
    
    //TileMap
    func giveTileMapPhysicsBody(map: SKTileMapNode) {
        let tileMap = map
        
        let tileSize = tileMap.tileSize
        let halfWidth = CGFloat(tileMap.numberOfColumns) / 2.0 * tileSize.width
        let halfHeight = CGFloat(tileMap.numberOfRows) / 2.0 * tileSize.height
        
        for col in 0..<tileMap.numberOfRows{
            for row in 0..<tileMap.numberOfRows{
                if let tileDefinition = tileMap.tileDefinition(atColumn: col, row: row) {
                    let isEdgeTile = tileDefinition.userData?["Add Body"] as? Int
                    if (isEdgeTile != 0) {
                        let tileArray = tileDefinition.textures
                        let tileTexture = tileArray[0]
                        let x = CGFloat(col) * tileSize.width - halfWidth + (tileSize.width/2)
                        let y = CGFloat(row) * tileSize.height - halfHeight + (tileSize.height/2)
                        _ = CGRect(x: 0, y: 0, width: tileSize.width, height: tileSize.height)
                        let tileNode = SKNode()
                        
                        tileNode.position = CGPoint(x: x, y: y)
                        tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: (tileTexture.size().width), height: (tileTexture.size().height)))
                        tileNode.physicsBody?.linearDamping = 0
                        tileNode.physicsBody?.affectedByGravity = false
                        tileNode.physicsBody?.allowsRotation = false
                        tileNode.physicsBody?.restitution = 0
                        tileNode.physicsBody?.isDynamic = false
                        tileNode.physicsBody?.friction = 20.0
                        tileNode.physicsBody?.mass = 30.0
                        tileNode.physicsBody?.contactTestBitMask = 0
                        tileNode.physicsBody?.fieldBitMask = 0
                        tileNode.physicsBody?.collisionBitMask = 0
                        
                        if (isEdgeTile == 1) {
                            tileNode.physicsBody?.restitution = 0.0
                            tileNode.physicsBody?.contactTestBitMask = ColliderType.PLAYER
                        }
                        
                        tileNode.physicsBody?.categoryBitMask = ColliderType.GROUND
                        
                        tileMap.addChild(tileNode)
                    }
                }
            }
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    func centerOnNode(node: SKNode) {
        self.camera!.run(SKAction.move(to: CGPoint(x: node.position.x, y: 0), duration: 0.2))
    }
    
    override func didFinishUpdate() {
        centerOnNode(node: player!)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        // Update Parallax
        parallaxComponentSystem?.update(deltaTime: dt)
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        self.lastUpdateTime = currentTime
    }
}
