//
//  SkillListViewController.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

class SkillListViewController: UIViewController, Presentable {
    var presenter: Any?
    var viewModel = SkillListViewModel(list: []) {
        didSet {
            configure(with: viewModel)
        }
    }
    
    private lazy var skillListView = SkillListView(frame: view.frame)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupConstraints()
        setupBackground()
        configure(with: viewModel)
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
    
    private func configure(with viewModel: ViewModel) {
        // TODO: UPdate viewModel
        let list = [
            SkillCardViewModel(name: "ReactiveSwift", icon: "", color: .blue),
            SkillCardViewModel(name: "Gardening", icon: "", color: .blue),
            SkillCardViewModel(name: "Machine Learning", icon: "", color: .blue),
            SkillCardViewModel(name: "Biking", icon: "", color: .blue),
            SkillCardViewModel(name: "Calculus", icon: "", color: .blue),
            SkillCardViewModel(name: "Statistics", icon: "", color: .blue)
        ]
        skillListView.configure(with: SkillListViewModel(list: list))
    }
}
