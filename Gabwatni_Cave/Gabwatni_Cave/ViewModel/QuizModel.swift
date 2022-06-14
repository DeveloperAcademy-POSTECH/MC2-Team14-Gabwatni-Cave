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
                 question: "동굴 생태계에\n없어서는 안 될 존재는?",
                 options: [
                    Option(id: 1, option: "박쥐(답)"),
                    Option(id: 2, option: "드래곤 밀리패드"),
                    Option(id: 3, option: "투명 도롱뇽"),
                 ]
                ),
            Quiz(id: 2,
                 question: "눈이 퇴화하였고\n불로불사 할 수 있는 생물은?",
                 options: [
                    Option(id: 1, option: "박쥐"),
                    Option(id: 2, option: "투명 도롱뇽(답)"),
                    Option(id: 3, option: "드래곤 밀리패드"),
                 ]
                ),
            Quiz(id: 3,
                 question: "동굴 팝콘이라\n부르기도 하는 지형지물은?",
                 options: [
                    Option(id: 1, option: "종유석"),
                    Option(id: 2, option: "석순"),
                    Option(id: 3, option: "동굴 산호(답)"),
                 ]
                ),
            Quiz(id: 4,
                 question: "동굴 바닥쪽으로 성장해 가는\n고드름 모양의 석회 기둥은?",
                 options: [
                    Option(id: 1, option: "석주"),
                    Option(id: 2, option: "석순"),
                    Option(id: 4, option: "종유석(답)"),
                 ]
                ),
            Quiz(id: 5,
                 question: "동굴 반딧불이라고도\n불리는 생물은?",
                 options: [
                    Option(id: 1, option: "반딧불이"),
                    Option(id: 2, option: "용식공"),
                    Option(id: 5, option: "아라크로캄파(답)"),
                 ]
                ),
        ]
    }
}


