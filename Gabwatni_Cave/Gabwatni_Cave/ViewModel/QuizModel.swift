//
//  QuizModel.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/10.
//

import Foundation

final class QuizModel: ObservableObject {
    @Published var shuffledQuizzes = quizzes.shuffled()
}

extension QuizModel {
    static var quizzes: [Quiz] {
        [
            Quiz(id: 1,
                 question: "첫번째 질문",
                 options: [
                    Option(id: 1, option: "답"),
                    Option(id: 2, option: "답변 1-2"),
                    Option(id: 3, option: "답변 1-3"),
                 ]
                ),
            Quiz(id: 2,
                 question: "2번째 질문",
                 options: [
                    Option(id: 1, option: "답변 2-1"),
                    Option(id: 2, option: "답"),
                    Option(id: 3, option: "답변 2-3"),
                 ]
                ),
            Quiz(id: 3,
                 question: "3번째 질문",
                 options: [
                    Option(id: 1, option: "답변 3-1"),
                    Option(id: 2, option: "답변 3-2"),
                    Option(id: 3, option: "답"),
                 ]
                ),
            Quiz(id: 4,
                 question: "4번째 질문",
                 options: [
                    Option(id: 1, option: "답변 4-1"),
                    Option(id: 2, option: "답변 4-2"),
                    Option(id: 4, option: "답"),
                 ]
                ),
            Quiz(id: 5,
                 question: "4번째 질문",
                 options: [
                    Option(id: 1, option: "답변 5-1"),
                    Option(id: 2, option: "답변 5-2"),
                    Option(id: 5, option: "답"),
                 ]
                ),
        ]
    }
}


