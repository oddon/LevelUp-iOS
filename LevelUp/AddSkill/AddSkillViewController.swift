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
    
    private let stackView = UIStackView()
    
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
        stackView.addSubview(skillTextInputView)
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        skillTextInputView.translatesAutoresizingMaskIntoConstraints = false
        view.constrain(edgesTo: stackView)
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

    }
    
    @objc func handleSaveButtonPress() {

    }
}
