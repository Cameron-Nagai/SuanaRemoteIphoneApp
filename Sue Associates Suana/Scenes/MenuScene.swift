//
//  MenuScene.swift
//  Sue Associates Suana
//
//  Created by Cameron on 6/9/20.
//  Copyright © 2020 Cameron Nagai. All rights reserved.
//

//
//  MenuScene.swift
//  Button Extravaganza Master
//
//  Created by Cameron on 4/4/20.
//  Copyright © 2020 Cameron Nagai. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        addLabels()
        
    }
    
    func addLabels() {
        let logo = SKSpriteNode(imageNamed: "EmergencyPushed")
        logo.size = CGSize(width: frame.size.width/3, height: frame.size.width/3)
        logo.position = CGPoint(x: frame.midX, y: frame.midY)
        let playLabel = SKLabelNode(text: "Tap to Play!")
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontColor=UIColor.white
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY + logo.frame.size.height - frame.maxY/3)
        addChild(logo)
        addChild(playLabel)
        animate(label: playLabel)
    }
    
    func animate(label: SKLabelNode) {
        
        
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
        //
        //        let sequence = SKAction.sequence([fadeOut, fadeIn])
        let sequence = SKAction.sequence([scaleUp, scaleDown])
        label.run(SKAction.repeatForever(sequence))
        
    }

}


