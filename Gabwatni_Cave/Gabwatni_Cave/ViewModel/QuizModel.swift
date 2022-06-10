//
//  QuizModel.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/09.
//

import Foundation

class QuizModel: ObservableObject {
    @Published var quizzes: [Quiz] = []
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            
            do {
                let quizzes = try decoder.decode([Quiz].self, from: data)
                self.quizzes = quizzes
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
}
