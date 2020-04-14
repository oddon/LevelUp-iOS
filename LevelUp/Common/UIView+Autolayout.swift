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
        topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top * -1).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left * -1).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).isActive = true
    }
}
