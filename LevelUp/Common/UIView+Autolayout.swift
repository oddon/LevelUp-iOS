//
//  UIView+Autolayout.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit


extension UIView {
    func constrain(edgesTo view: UIView, insets: UIEdgeInsets = UIEdgeInsets()) {
        topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom * -1).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right * -1).isActive = true
    }
    
    func constrain(edgesTo guide: UILayoutGuide, insets: UIEdgeInsets = UIEdgeInsets()) {
        topAnchor.constraint(equalTo: guide.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: insets.bottom * -1).isActive = true
        leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: insets.right * -1).isActive = true
    }
}
