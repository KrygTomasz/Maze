//
//  ViewController.swift
//  Maze
//
//  Created by Kryg Tomasz on 08.02.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setButtons() {
        
        startButton.setTitle("Start Game", for: .normal)
        startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        
    }
    
    func startGame() {
        
        
        
    }

}

