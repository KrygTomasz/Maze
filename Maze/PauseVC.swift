//
//  PauseVC.swift
//  Maze
//
//  Created by Kryg Tomasz on 19.02.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class PauseVC: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var resumeButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    
    var unpauseFunction: (() -> ())!
    var quitFunction: (() -> ())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func setView() {
        
        contentView.backgroundColor  = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        setButtons()
        
    }
    
    fileprivate func setButtons() {
        
        resumeButton.setTitle("Resume", for: .normal)
        resumeButton.addTarget(self, action: #selector(unpause), for: .touchUpInside)
        resumeButton.tintColor = UIColor.brown
        resumeButton.setImage(#imageLiteral(resourceName: "Resume"), for: .normal)
        
        quitButton.setTitle("Quit", for: .normal)
        quitButton.addTarget(self, action: #selector(quit), for: .touchUpInside)
        quitButton.tintColor = UIColor.brown
        quitButton.setImage(#imageLiteral(resourceName: "Quit"), for: .normal)
        
    }

    func unpause() {
        
        dismiss(animated: true, completion: unpauseFunction)
        
    }
    
    func quit() {
        
        dismiss(animated: true, completion: quitFunction)
        
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
