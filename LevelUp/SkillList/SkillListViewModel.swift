//
//  SkillListViewModel.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import Foundation

struct SkillListViewModel {
    var list: [SkillCellViewModel]
}

struct SkillCellViewModel {
    let name: String
    let icon: String
}
