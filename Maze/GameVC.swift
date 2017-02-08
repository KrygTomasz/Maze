//
//  GameVC.swift
//  Maze
//
//  Created by Kryg Tomasz on 08.02.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit
import CoreMotion

class GameVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    var ball: Ball!
    
    var motionManager = CMMotionManager()
    var animator: UIDynamicAnimator?
    var gravity: UIGravityBehavior?
    var direction = CGVector(dx: 0.0, dy: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBall()
        mainView.layoutIfNeeded()

        createGravity()
        
        startAccelerometer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func initBall() {
        
        guard let ballObject: Ball = UINib(nibName: "Ball", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Ball else { return }
        self.ball = ballObject
        ball.setView()
        mainView.addSubview(ball)
        
        //ball.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        //ball.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        
    }
    
    func createGravity() {
        
        animator = UIDynamicAnimator(referenceView: mainView)
        
        gravity = UIGravityBehavior(items: [ball])
        gravity?.gravityDirection = direction
        
        animator?.addBehavior(gravity!)
        
    }
    
    func startAccelerometer() {
        
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main) {
            data, _ in
            if let accelerometerData = data {
                self.direction.dx = CGFloat(3*accelerometerData.acceleration.x)
                self.direction.dy = CGFloat(-3*accelerometerData.acceleration.y)
                self.gravity?.gravityDirection = self.direction
                
                print("X: \(accelerometerData.acceleration.x)")
                print("Y: \(accelerometerData.acceleration.y)")
                print("Z: \(accelerometerData.acceleration.z)")
            }
            
            // Do any additional setup after loading the view.
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
