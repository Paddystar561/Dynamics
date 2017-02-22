//
//  ViewController.swift
//  DynamicsExample
//
//  Created by Patrick Doody on 2/22/17.
//  Copyright © 2017 Patrick Doody. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    private var animator: UIDynamicAnimator!
    private var gravity: UIGravityBehavior!
    private var collision: UICollisionBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x:100, y:100, width:100, height:100)
        let square = UIView(frame:rect)
        square.backgroundColor = UIColor.green
        view.addSubview(square)
        
        let barrier = CGRect(x:0, y:300, width:130, height:20)
        let barriera = UIView(frame:barrier)
        barriera.backgroundColor = UIColor.red; view.addSubview(barriera)
        
        
        
        
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square]); animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
        
        collision.collisionDelegate = self
        
        func collisionBehavior(_behaviour:UICollisionBehavior, beganContactForItem: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint){
            if let unwrapedIdentifier = identifier {
                print("Boundary contact occurred - \(unwrapedIdentifier)")
            }
            else {
                print("Boundary contact occurred - (unidentified)")
            }
        }
        
        
        let rightEdge = CGPoint(x:barriera.frame.origin.x + barriera.frame.size.width,y:barriera.frame.origin.y)
        collision.addBoundary(withIdentifier:"barriera" as NSCopying, from:barriera.frame.origin, to:rightEdge)
        
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

