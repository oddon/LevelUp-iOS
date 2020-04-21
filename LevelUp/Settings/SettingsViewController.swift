//
//  SettingsViewController.swift
//  LevelUp
//
//  Created by Don Vo on 4/14/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var presenter: Any?
    var viewModel = SkillListViewModel(list: [])
    
    private lazy var skillListView = SkillListView(frame: view.frame)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupConstraints()
        setupBackground()
        setupNavigationBar()
        update(with: viewModel)
    }
    
    private func setupViewHierarchy() {
        view.addSubview(skillListView)
    }
    
    private func setupConstraints() {
        skillListView.translatesAutoresizingMaskIntoConstraints = false
        view.constrain(edgesTo: skillListView)
    }
    
    private func setupBackground() {
        view.backgroundColor = Color.background.uiColor
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Skills"
    }
    
    private func update(with viewModel: SkillListViewModel) {
        // TODO: Update viewModel
        let list = [
            SkillCardViewModel(name: "ReactiveSwift", level: "16", icon: "", color: .blue),
            SkillCardViewModel(name: "Gardening", level: "8", icon: "", color: .blue),
            SkillCardViewModel(name: "Machine Learning", level: "14", icon: "", color: .blue),
            SkillCardViewModel(name: "Biking", level: "12", icon: "", color: .blue),
            SkillCardViewModel(name: "Calculus", level: "55", icon: "", color: .blue),
            SkillCardViewModel(name: "Statistics", level: "21", icon: "", color: .blue)
        ]
        skillListView.update(with: SkillListViewModel(list: list))
    }
}
