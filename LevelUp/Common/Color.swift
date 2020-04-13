//
//  Color.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

enum Color { // TODO: Maybe rename this to something else
    case background
    
    var uiColor: UIColor {
        switch self {
        case .background:
            return .white
        }
    }
}
