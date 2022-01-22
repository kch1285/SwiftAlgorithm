//
//  스킬트리.swift
//  
//
//  Created by chihoooon on 2022/01/22.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    return skill_trees.filter {
        let filteredSkill = $0.filter {
            return skill.index(of: $0) != nil
        }
        print(filteredSkill)
        return skill.hasPrefix(filteredSkill)
    }.count
}
