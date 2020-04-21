//
//  File.swift
//  LevelUp
//
//  Created by Don Vo on 4/20/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    private let tabs: [Tab] = [
        .timer,
        .skills,
        .stats,
        .settings
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = tabs.map({ createNavigationController(for: $0) })
    }
    
    private func createNavigationController(for tab: Tab) -> UINavigationController {
        let viewController = tab.viewControllerType.init()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = tab.title
        navigationController.tabBarItem.image = tab.icon
        return navigationController
    }
}
