//
//  Quiz.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/09.
//

import Foundation

struct Quiz: Identifiable {
    var id: Int
    var question: String
    var options: [Option]
}

struct Option: Identifiable {
    var id: Int
    var option: String
}
