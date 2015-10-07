//
//  GameScene.swift
//  FlappyFly
//
//  Created by Andrew Brandt on 10/6/15.
//  Copyright (c) 2015 com.doryStudios. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    private var flappy: SKSpriteNode!
    private var grounds: SKNode!
    
    var timeStamp: CFTimeInterval = -1.0

    let MOVE_CONST = 100.0

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 65;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        if let node = childNodeWithName("flappy") as? SKSpriteNode {
            flappy = node
            print("found flappy")
        }
        
        if let ground = childNodeWithName("ground") {
            grounds = ground
        }
//        physicsWorld.gravity = CGVectorMake(0.0, -1.0)
        
        
//        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        let vector = CGVectorMake(0.0, 100.0)
        flappy.physicsBody?.applyImpulse(vector)
        print("flappy flew")
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            self.addChild(sprite)
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
//        if let velocity = flappy.physicsBody?.velocity {
//            var y = velocity.dy
//            print("y velocity: \(y)")
////            let newY = clamp( y, min: -10.0 as CGFloat , max: 10.0 as CGFloat)
//            if y > 50.0 {
//                y = 50.0
//            } else if y < -50.0 {
//                y = -50.0
//            }
//            let newVelocity = CGVectorMake(velocity.dx, CGFloat(y))
//            flappy.physicsBody?.velocity = newVelocity
//        }
        if timeStamp < 0 {
            timeStamp = currentTime
        }
        let diff = currentTime - timeStamp
        timeStamp = currentTime
        let moveSpeed = CGFloat(MOVE_CONST * diff)
//        print(moveSpeed)
        grounds.position = CGPointMake(grounds.position.x - moveSpeed, grounds.position.y)
    }
}
