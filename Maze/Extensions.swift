//
//  Extensions.swift
//  Maze
//
//  Created by Kryg Tomasz on 19.02.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

extension UICollisionBehavior {
    
    func addStaticItem(_ item: UIView, named identifier: String) {

        var newX = item.frame.origin.x + 2
        var newY = item.frame.origin.y + 2
        var newWidth = item.frame.width - 4
        var newHeight = item.frame.height - 4
        
        self.addBoundary(withIdentifier: identifier as NSCopying, for: UIBezierPath(rect: CGRect(x: newX, y: newY, width: newWidth, height: newHeight)))
        
    }
    
}
