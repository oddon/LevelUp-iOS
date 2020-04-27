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

// For testing purposes
class SkillMemoryStoreImpl: SkillStore {
    private static var skillList = SkillListModel(list: [
        SkillModel(name: "Reactive Swift"),
        SkillModel(name: "Gardening"),
        SkillModel(name: "Machine Learning"),
        SkillModel(name: "Biking"),
        SkillModel(name: "Calculus"),
        SkillModel(name: "Statistics")
    ])
    
    var skillList: SkillListModel {
        return SkillMemoryStoreImpl.skillList
    }

    func add(skill: SkillModel) {
        SkillMemoryStoreImpl.skillList = skillList
    }
}
