//
//  GameScene.swift
//  SpriteKitIntro
//
//  Created by MacStudent on 2019-02-06.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    // Example 1  - Adding text to the screen
    let label = SKLabelNode(text:"HELLO WORLD!")
    let label2 = SKLabelNode(text:"ABCD")
    let label3 = SKLabelNode(text:"kanwar")
    let label4 = SKLabelNode(text:"kanwar1")
    
    // Example 2 - Draw a square on the screen
    let square = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 50, height: 50))
    
    // Example 3 - Draw an image on the screen
    let duck = SKSpriteNode(imageNamed: "psyduck")
    
    // Example 4 - Draw a circle on the screen
    let circle = SKShapeNode(circleOfRadius: 10)
    
    
    
    override func update(_ currentTime: TimeInterval) {
       // print("time: \(currentTime)")
        
    }
    
    
    //finger up
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self) // self is the current SKScene
            let node = atPoint(location)
            
            // To get the touched half of the screen I do this
            if (location.x < self.size.width/2) {
                // left half touched, do something
                print("touched left")
            }
            
            if location.x >= self.size.width/2 {
                // right half touched, do something
                print("touched right")
            }
        }

    }
    
    
    override func didMove(to view: SKView) {
        // output the size of the screen
        print("Screen size (w,h): \(size.width),\(size.height)")
        
        // Add images to the scene
        let bug = SKSpriteNode(imageNamed: "caterpie")
        bug.position = CGPoint(x:size.width/2, y:size.height/2)
        addChild(bug)
        
        duck.position = CGPoint(x:size.width/2+100, y:size.height/2)
        addChild(duck)
        
        
        // configure your text
        label.position = CGPoint(x:size.width/2, y:size.height/2)
        label.fontSize = 45
        label.fontColor = SKColor.yellow

        label2.fontSize = 60
        label2.position = CGPoint(x:size.width/2, y:200)
        
        // add it to your scene (draw it!)
        addChild(label)
        addChild(label2)
        addChild(label3)
        
        // configure the square
        square.position = CGPoint(x: 50, y:50);
        // add square to scene
        addChild(square)
        
        // configure your circle
        // -----------------------
        // color of border
        circle.strokeColor = SKColor.green
        // width of border
        circle.lineWidth = 10
        // fill color
        circle.fillColor = SKColor.gray
        // location of circle
        circle.position = CGPoint(x:200, y:600)
        addChild(circle)
        
        
        
        // movement ----- ACTion
        // 1. Single movements
        //2. Sequence of movements (combine Actions)
        
        //1. define movement up down circle
        //2. Apply movement to character
        
        //1. Single movement
        // move SPECIFIC DISTANCE
        let moveAction = SKAction.moveBy(x: 100, y: 0, duration: 5)
        let moveAction4 = SKAction.moveBy(x: 0, y: 100, duration: 5)
        let moveAction5 = SKAction.moveBy(x: 0, y: -50, duration: 5)
        let moveAction6 = SKAction.moveBy(x: 50, y: 50, duration: 5)
        let sequence:SKAction = SKAction.sequence([moveAction, moveAction4])
        let sequence2:SKAction = SKAction.sequence([moveAction, moveAction4])
        circle.run(sequence.reversed())
        duck.run(moveAction6.reversed())
        square.run(SKAction.repeat(sequence2, count: 3))
        
       // let Squarepostion = CGPoint(x: self.size.width/2, y:self.size.height/2)
       // let moveTOCircleAction = SKAction.moveTo(x: Squarepostion, duration: 5)
        // move to spcific coordinate
        //let moveAction2 = SKAction.moveTo(x: 300, duration: 4)
        
        //let newPosition = CGPoint(x: 100, y:700)
       // let moveAction3 = SKAction.move(to: newPosition, duration: 5)
        //circle.run(moveAction)
        //circle.run(moveAction4)
        
        
        //print("width of screen : \(self.size.width) px")
        //print("height of screen : \(self.size.height) px")
        // check if cirle touches the square
        if(circle.frame.intersects(square.frame))
        {
            print("collision detected")
        }
        
    }
    

    
}
