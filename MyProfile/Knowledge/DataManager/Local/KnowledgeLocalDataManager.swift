//
//  KnowledgeLocalDataManager.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class KnowledgeLocalDataManager: KnowledgeLocalDataManagerInputProtocol {
  func loadSkills(completion: @escaping (SkillsResult) -> ()) {
    completion(.success(getSkills()))
  }

  private func getSkills() -> [Skill] {
    return ["Blogging and Wiki creation",
      "Creating PLNs",
      "Blackboard",
      "Photoshop",
      "Illustrator",
      "Adobe CS",
      "HTML",
      "UI/UX",
      "Branding",
      "Technical writing",
      "Information technology",
      "Data management",
      "Project management",
      "Computer science fundamentals",
      "Data modeling",
      "System design",
      "Statistics and probability",
      "Technical reporting]"
      ].compactMap {
        Skill(name: $0, color: .random())
    }
  }
}
