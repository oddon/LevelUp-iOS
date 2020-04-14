//
//  SkillListViewModel.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

struct SkillListViewModel {
    var list: [SkillCardViewModel]
}

struct SkillCardViewModel {
    let name: String
    let level: String
    let icon: String
    let color: SkillCardColor
}

enum SkillCardColor {
    private enum Constants {
        static let alpha: CGFloat = 1
    }
    
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    
    var uiColor: UIColor {
        switch self {
        case .red:
            return UIColor(red: 0.827, green: 0.184, blue: 0.184, alpha: Constants.alpha)
        case .orange:
            return UIColor(red: 0.961, green: 0.486, blue: 0, alpha: Constants.alpha)
        case .yellow:
            return UIColor(red: 0.984, green: 0.753, blue: 0.176, alpha: Constants.alpha)
        case .green:
            return UIColor(red: 0.22, green: 0.557, blue: 0.235, alpha: Constants.alpha)
        case .blue:
            return UIColor(red: 0.098, green: 0.463, blue: 0.824, alpha: Constants.alpha)
        case .purple:
            return UIColor(red: 0.318, green: 0.176, blue: 0.659, alpha: Constants.alpha)
        }
    }
    
    var cgColor: CGColor {
        return uiColor.cgColor
    }
}
