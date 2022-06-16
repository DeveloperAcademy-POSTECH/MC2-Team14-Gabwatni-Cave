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
                 question: "동굴 생태계에\n없어서는 안 되는 생물은?",
                 options: [
                    Option(id: 1, option: "박쥐"),
                    Option(id: 2, option: "드래곤 밀리패드"),
                    Option(id: 3, option: "투명 도롱뇽"),
                 ]
                ),
            Quiz(id: 2,
                 question: "눈이 퇴화하였고\n불로불사 할 수 있는 생물은?",
                 options: [
                    Option(id: 1, option: "점박이꼬리도롱뇽"),
                    Option(id: 2, option: "텍사스동굴도롱뇽"),
                    Option(id: 3, option: "꼬리치레도롱뇽"),
                 ]
                ),
            Quiz(id: 3,
                 question: "이 동굴의 종류는?",
                 options: [
                    Option(id: 1, option: "해식 동굴"),
                    Option(id: 2, option: "용암 동굴"),
                    Option(id: 3, option: "석회 동굴"),
                 ]
                ),
            Quiz(id: 4,
                 question: "동굴 바닥쪽으로 성장해 가는\n고드름 모양의 석회 기둥은?",
                 options: [
                    Option(id: 1, option: "석주"),
                    Option(id: 2, option: "종유관"),
                    Option(id: 4, option: "종유석"),
                 ]
                ),
            Quiz(id: 5,
                 question: "동굴 천장에 살며\n푸른 빛을 내는 생물은?",
                 options: [
                    Option(id: 1, option: "동굴 반딧불"),
                    Option(id: 2, option: "투명 달팽이"),
                    Option(id: 5, option: "아라크노캄파"),
                 ]
                ),
            Quiz(id: 6,
                 question: "종유석과 석순이 자라나다\n만나 생기는 기둥은?",
                 options: [
                    Option(id: 1, option: "기둥"),
                    Option(id: 2, option: "석순"),
                    Option(id: 6, option: "석주"),
                 ]
                ),
        ]
    }
}


