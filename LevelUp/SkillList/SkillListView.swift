//
//  SkillListView.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

class SkillListView: UIView {
    private enum Constants {
        static let skillCellHeight: CGFloat = 140
        static let skillCellReuseIdentifier = "SkillCell"
    }
    
    private var viewModel: SkillListViewModel = SkillListViewModel(list: [])
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        view.rowHeight = Constants.skillCellHeight
        view.register(SkillCell.self, forCellReuseIdentifier: Constants.skillCellReuseIdentifier)
        view.dataSource = self
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
        configure(with: viewModel)
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

extension SkillListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.skillCellHeight
    }
}
