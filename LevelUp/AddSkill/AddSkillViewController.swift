//
//  AddSkillViewController.swift
//  LevelUp
//
//  Created by Don Vo on 4/20/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

class AddSkillViewController: UIViewController {
    lazy var presenter: AddSkillPresenter = {
        return AddSkillPresenter()
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let skillLabel: UILabel = {
        let label = UILabel()
        label.text = "Skill Name"
        return label
    }()
    private let skillTextInputView: UITextView = {
        let textView = UITextView()
        textView.text = "Soccer"
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupConstraints()
        setupBackground()
        setupNavigationBar()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(skillLabel)
        stackView.addArrangedSubview(skillTextInputView)
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        skillTextInputView.translatesAutoresizingMaskIntoConstraints = false
        stackView.constrain(edgesTo: view.safeAreaLayoutGuide)
    }
    
    private func setupBackground() {
        view.backgroundColor = .gray
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancelButtonPress))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSaveButtonPress))
    }
}

extension AddSkillViewController {
    @objc func handleCancelButtonPress() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSaveButtonPress() {
        let skillName = skillTextInputView.text!
        presentingViewController?.dismiss(animated: true, completion: {
            self.presenter.didSaveSkill(name: skillName)
        })
    }
}
