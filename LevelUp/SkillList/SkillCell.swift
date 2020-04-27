//
//  SkillCell.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

class SkillCell: UITableViewCell {
    private enum Constants {
        static let cellPadding: CGFloat = 10
    }
    
    private let skillCard = SkillCardView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(skillCard)

    }
    
    private func setupConstraints() {
        skillCard.translatesAutoresizingMaskIntoConstraints = false
        skillCard.constrain(edgesTo: contentView,
                              insets: UIEdgeInsets(top: Constants.cellPadding,
                                                   left: Constants.cellPadding,
                                                   bottom: Constants.cellPadding,
                                                   right: Constants.cellPadding))
    }
    
    func update(with viewModel: SkillCardViewModel) {
        skillCard.update(with: viewModel)
    }
}

class SkillCardView: UIView {
    private enum Constants {
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 8
        static let topPadding: CGFloat = 4
        static let leadingTabWidth: CGFloat = 124
        static let levelLabelFont: CGFloat = 48
        static let levelMinimumScaleFactor: CGFloat = 0.5
    }
    
    private let nameLabel = UILabel()
    private let levelLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.lightText.uiColor
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: Constants.levelLabelFont)
        label.minimumScaleFactor = Constants.levelMinimumScaleFactor
        return label
    }()
    private let leadingTabView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    private let trailingBodyLayoutGuide = UILayoutGuide()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
        setupBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(leadingTabView)
        addLayoutGuide(trailingBodyLayoutGuide)
        addSubview(nameLabel)
        addSubview(levelLabel)
    }
    
    private func setupBorder() {
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = Color.cardBorder.uiColor.cgColor
        layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true
    }
    
    private func setupConstraints() {
        leadingTabView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        
        leadingTabView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        leadingTabView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        leadingTabView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        leadingTabView.widthAnchor.constraint(equalToConstant: Constants.leadingTabWidth).isActive = true
        
        trailingBodyLayoutGuide.leadingAnchor.constraint(equalTo: leadingTabView.trailingAnchor).isActive = true
        trailingBodyLayoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        trailingBodyLayoutGuide.topAnchor.constraint(equalTo: topAnchor).isActive = true
        trailingBodyLayoutGuide.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: trailingBodyLayoutGuide.topAnchor, constant: Constants.topPadding).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: trailingBodyLayoutGuide.centerXAnchor).isActive = true
        
        levelLabel.centerYAnchor.constraint(equalTo: leadingTabView.centerYAnchor).isActive = true
        levelLabel.widthAnchor.constraint(equalTo: leadingTabView.widthAnchor).isActive = true
    }
    
    func update(with viewModel: SkillCardViewModel) {
        nameLabel.text = viewModel.name
        levelLabel.text = viewModel.level
        layer.borderColor = viewModel.color.cgColor
        leadingTabView.backgroundColor = viewModel.color.uiColor
    }
}
