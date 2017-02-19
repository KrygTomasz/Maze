//
//  Wall.swift
//  Maze
//
//  Created by Kryg Tomasz on 19.02.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class Wall: UIView {
    
    var id: String = ""
    //var view: UIView!
    
    func setView(frame: CGRect,named identifier: String) {
        
        self.frame = frame
        id = identifier
        self.backgroundColor = UIColor.red
        //mainView.addSubview(view)
        
    }
    
    func add(to collision: UICollisionBehavior) {
        
        //collision.addItem(view)
        //collision.addBoundary(withIdentifier: self.id as NSCopying, for: UIBezierPath(rect: self.frame))
        
    }
    
}
