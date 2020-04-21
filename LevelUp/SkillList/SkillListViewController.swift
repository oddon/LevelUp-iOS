//
//  SkillListViewController.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

protocol SkillListViewControllerDelegate { // TODO: Figure out a better name for this
    func start()
    func handleAddButtonPress()
}

class SkillListViewController: UIViewController {
    lazy var presenter: SkillListViewControllerDelegate = {
        let presenter = SkillListViewPresenter()
        presenter.delegate = self
        return presenter
    }()
    
    private lazy var skillListView = SkillListView(frame: view.frame)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupConstraints()
        setupBackground()
        setupNavigationBar()
        presenter.start()
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddButtonPress))
    }
}

extension SkillListViewController {
    @objc func handleAddButtonPress() {
        presenter.handleAddButtonPress()
    }
}

extension SkillListViewController: SkillListViewPresenterDelegate {
    func update(with viewModel: SkillListViewModel) {
        skillListView.update(with: viewModel)
        let vc = UINavigationController(rootViewController: AddSkillViewController())
        vc.modalPresentationStyle = .popover
        present(vc, animated: true, completion: nil)
    }
}
