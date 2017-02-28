//
//  ViewTools.swift
//  Maze
//
//  Created by Kryg Tomasz on 28.02.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class ViewTools {
    
    static func addShadow(to view: UIView) {
    
        view.layer.shadowColor = UIColor.black.cgColor
        //view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 2
        view.layer.shouldRasterize = false
        view.layer.shadowOpacity = 1
        view.layer.masksToBounds = false

    }
    
}
