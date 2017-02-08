//
//  Ball.swift
//  Maze
//
//  Created by Kryg Tomasz on 08.02.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class Ball: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var image: UIImageView!
    
    func setView() {
    
        //image.backgroundColor = UIColor.black
        
        //image.frame = CGRect(x: 10, y: 20, width: 100, height: 100)
        image.image = #imageLiteral(resourceName: "ball")
    
    }
}
