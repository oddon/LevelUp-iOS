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
            SkillCellViewModel(name: "Pineapple", icon: ""),
            SkillCellViewModel(name: "Strawberry", icon: ""),
            SkillCellViewModel(name: "Cherry", icon: ""),
            SkillCellViewModel(name: "Watermelon", icon: ""),
            SkillCellViewModel(name: "Banana", icon: "")
        ]
        skillListView.configure(with: SkillListViewModel(list: list))
    }
}


class SkillListView: UIView {
    private enum Constants {
        static let skillCellReuseIdentifier = "SkillCell"
    }
    
    private var viewModel: SkillListViewModel = SkillListViewModel(list: [])
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(SkillCell.self, forCellReuseIdentifier: Constants.skillCellReuseIdentifier)
        view.dataSource = self
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
    }
    
    private func setupViewHierarchy() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        constrain(edgesTo: tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: SkillListViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension SkillListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.skillCellReuseIdentifier) as? SkillCell else {
            return UITableViewCell()
        }
        let cellViewModel = viewModel.list[indexPath.row]
        cell.configure(with: cellViewModel)
        return cell
    }
}

class SkillCell: UITableViewCell {
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(nameLabel)
        contentView.constrain(edgesTo: nameLabel)
    }
    
    private func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func configure(with viewModel: SkillCellViewModel) {
        nameLabel.text = viewModel.name
    }
}

extension UIView {
    func constrain(edgesTo view: UIView) {
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
