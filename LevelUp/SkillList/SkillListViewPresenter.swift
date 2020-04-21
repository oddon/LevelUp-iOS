//
//  SkillListViewPresenter.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import Foundation

protocol SkillListViewPresenterDelegate: AnyObject {
    func update(with viewModel: SkillListViewModel)
}

class SkillListViewPresenter {
    weak var delegate: SkillListViewPresenterDelegate?
    private var viewModel = SkillListViewModel(list: [
        SkillCardViewModel(name: "ReactiveSwift", level: "16", icon: "", color: .blue),
        SkillCardViewModel(name: "Gardening", level: "8", icon: "", color: .blue),
        SkillCardViewModel(name: "Machine Learning", level: "14", icon: "", color: .blue),
        SkillCardViewModel(name: "Biking", level: "12", icon: "", color: .blue),
        SkillCardViewModel(name: "Calculus", level: "55", icon: "", color: .blue),
        SkillCardViewModel(name: "Statistics", level: "21", icon: "", color: .blue)
    ])
}

extension SkillListViewPresenter: SkillListViewControllerDelegate {
    func start() {
        delegate?.update(with: viewModel)
    }
    
    func handleAddButtonPress() {
        viewModel.list.append(SkillCardViewModel(name: "Pineapple Sculpting", level: "21", icon: "", color: .blue))
        delegate?.update(with: viewModel)
    }
}
