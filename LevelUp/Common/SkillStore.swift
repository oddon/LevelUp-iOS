//
//  SkillStore.swift
//  LevelUp
//
//  Created by Don Vo on 4/26/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import Foundation

protocol SkillStore {
    var skillList: SkillListModel { get }
    func add(skill: SkillModel)
}

class SkillMemoryStoreImpl: SkillStore {
    var skillList: SkillListModel
    
    init(with skillList: SkillListModel) {
        self.skillList = skillList
    }
    
    func add(skill: SkillModel) {
        skillList.list.append(skill)
    }
}
