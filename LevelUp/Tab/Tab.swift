//
//  File.swift
//  LevelUp
//
//  Created by Don Vo on 4/20/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

enum Tab {
    case timer
    case skills
    case stats
    case settings
    
    var title: String {
        switch self {
        case .timer:
            return "Timer"
        case .skills:
            return "Skills"
        case .stats:
            return "Stats"
        case .settings:
            return "Settings"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .timer:
            return #imageLiteral(resourceName: "Timer")
        case .skills:
            return #imageLiteral(resourceName: "Skills")
        case .stats:
            return #imageLiteral(resourceName: "Stats")
        case .settings:
            return #imageLiteral(resourceName: "Settings")
        }
    }
    
    var viewControllerType: UIViewController.Type {
        switch self {
        case .timer:
            return SkillListViewController.self
        case .skills:
            return SkillListViewController.self
        case .stats:
            return SkillListViewController.self
        case .settings:
            return SettingsViewController.self
        }
    }
}
