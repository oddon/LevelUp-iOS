//
//  AddSkillPresenter.swift
//  LevelUp
//
//  Created by Don Vo on 4/20/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import Foundation

class AddSkillPresenter {
    
    private let skillStore = SkillMemoryStoreImpl()
    
    func start() {
        
    }
    
    func didSaveSkill(name: String) {
        skillStore.add(skill: SkillModel(name: name))
    }
}
