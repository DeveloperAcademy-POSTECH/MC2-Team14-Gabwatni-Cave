//
//  Quiz.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/09.
//

import Foundation

struct Quiz: Identifiable, Decodable {
    var id: Int
    var question: String
    var correctIndex: Int
    var answers: [String]
}
