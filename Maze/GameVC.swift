//
//  GameVC.swift
//  Maze
//
//  Created by Kryg Tomasz on 08.02.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    var ball: Ball?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBall()
        mainView.layoutIfNeeded()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initBall() {
        
        guard let ball: Ball = UINib(nibName: "Ball", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Ball else { return }
        ball.setView()
        mainView.addSubview(ball)
        
        ball.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        ball.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        
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
