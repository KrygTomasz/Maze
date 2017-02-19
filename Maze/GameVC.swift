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
    @IBOutlet weak var bottomWall: UIView!
    @IBOutlet weak var topWall: UIView!
    @IBOutlet weak var leftWall: UIView!
    @IBOutlet weak var rightWall: UIView!
    
    fileprivate var ball: Ball!
    
    fileprivate var motionManager = CMMotionManager()
    fileprivate var animator: UIDynamicAnimator?
    
    fileprivate var collision: UICollisionBehavior!
    
    fileprivate var gravity: UIGravityBehavior!
    fileprivate var direction = CGVector(dx: 0.0, dy: 0.0)
    fileprivate var directionBeforePause = CGVector(dx: 0.0, dy: 0.0)
    
    var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAnimator()
        
        initWalls()
        initBall()

        addBehaviors()
        
        launchAccelerometer()
        
        setGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func initAnimator() {
        
        animator = UIDynamicAnimator(referenceView: mainView)
        
    }
    
    fileprivate func initBall() {
        
        guard let ballObject: Ball = UINib(nibName: "Ball", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Ball else { return }
        self.ball = ballObject
        ball.setView()
        mainView.addSubview(ball)
        
        ball.translatesAutoresizingMaskIntoConstraints = false
        ball.topAnchor.constraint(equalTo: topWall.bottomAnchor, constant: 5).isActive = true
        ball.leftAnchor.constraint(equalTo: leftWall.rightAnchor, constant: 5).isActive = true
        
        mainView.layoutIfNeeded()
        
    }
    
    fileprivate func initWalls() {
        
        bottomWall.backgroundColor = UIColor.brown
        topWall.backgroundColor = UIColor.brown
        leftWall.backgroundColor = UIColor.brown
        rightWall.backgroundColor = UIColor.brown
        
    }
    
    fileprivate func addBehaviors() {
        
        createBallBehavior()
        createCollisions()
        createGravity()
        
    }
    
    fileprivate func createBallBehavior() {
        
        let ballBehavior: UIDynamicItemBehavior = UIDynamicItemBehavior(items: [ball])
        ballBehavior.allowsRotation = false
        animator?.addBehavior(ballBehavior)
        
    }
    
    fileprivate func createCollisions() {
        
        collision = UICollisionBehavior(items: [ball])
        collision.addStaticItem(bottomWall, named: "bottomWall")
        collision.addStaticItem(topWall, named: "topWall")
        collision.addStaticItem(rightWall, named: "rightWall")
        collision.addStaticItem(leftWall, named: "leftWall")

        let wall1 = Wall()
        wall1.setView(frame: CGRect(x: 100, y: 100, width: 100, height: 100), named: "wall1")
        mainView.addSubview(wall1)
        collision.addStaticItem(wall1, named: wall1.id)
        
        collision?.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collision)
    
    }
    
    fileprivate func createGravity() {
        
        gravity = UIGravityBehavior(items: [ball])
        gravity?.gravityDirection = self.directionBeforePause
        
        animator?.addBehavior(gravity)
        
    }
    
    fileprivate func launchAccelerometer() {
        
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main) {
            data, _ in
            if let accelerometerData = data {
                self.direction.dx = CGFloat(3*accelerometerData.acceleration.x)
                self.direction.dy = CGFloat(-3*accelerometerData.acceleration.y)
                self.gravity?.gravityDirection = self.direction
                
                //print("X: \(accelerometerData.acceleration.x)")
                //print("Y: \(accelerometerData.acceleration.y)")
                //print("Z: \(accelerometerData.acceleration.z)")
            }
            
            // Do any additional setup after loading the view.
        }
        
    }
    
    fileprivate func setGesture() {
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(showPauseMenu))
        mainView.addGestureRecognizer(tapGesture)
        
    }
    
    func showPauseMenu() {
        
        pauseGame()
        guard let pauseVC: PauseVC = UINib(nibName: "PauseVC", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? PauseVC else { return }
        pauseVC.modalPresentationStyle = .overCurrentContext
        pauseVC.unpauseFunction = unpauseGame
        pauseVC.quitFunction = backToMenu
        self.present(pauseVC, animated: true, completion: nil)
        
    }
    
    func pauseGame() {
        
        directionBeforePause = direction
        motionManager.stopAccelerometerUpdates()
        animator?.removeAllBehaviors()
        
    }
    
    func unpauseGame() {
        
        addBehaviors()
        print("UNPAUSED")
        launchAccelerometer()
        
    }
    
    func backToMenu() {
        
        let _ = self.navigationController?.popViewController(animated: true)
        
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
