//
//  QuizView.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/09.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var quizModel: QuizModel
    
    @State var alive = true
    @State private var clearQuiz = false
    @State private var currentQuizIndex = 0
    
    var body: some View {
        // 퀴즈 - 살아있을 때
        if alive && !clearQuiz {
            ZStack {
                // 배경
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                VStack {
                    // 첫 번째 질문일때의 보스 대사
                    if currentQuizIndex == 0 {
                        Text("동굴에 관한 퀴즈를 맞춰봐라!")
                            .font(.custom("Sam3KRFont", size: 36))
                        
                    }
                    // 두 번째 질문일때의 보스 대사
                    else if currentQuizIndex == 1 {
                        Text("헉! 그렇다면 이건 어떠냐!")
                            .font(.custom("Sam3KRFont", size: 36))
                        
                    }
                    // 세 번째(마지막) 질문일때의 보스 대사
                    else if currentQuizIndex == 2 {
                        Text("이럴수가... 마지막이다!")
                            .font(.custom("Sam3KRFont", size: 36))
                        
                    }
                    
                    // 질문
                    Text(quizModel.shuffledQuizzes[currentQuizIndex].question)
                        .font(.custom("Sam3KRFont", size: 28))
                        .padding(.top)
                    
                    // 보스
                    LottieView("boss")
                        .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
                    
                    // 선택지
                    ForEach(quizModel.shuffledQuizzes[currentQuizIndex].options.shuffled()) { option in
                        Button {
                            // 정답이면 다음 문제로 넘어감
                            if quizModel.shuffledQuizzes[currentQuizIndex].id == option.id {
                                // 세 문제만 출제
                                if currentQuizIndex < 2 {
                                    currentQuizIndex += 1
                                } else {
                                    // 전부 맞추면 랜덤게임 뷰로 넘어감
                                    clearQuiz = true
                                }
                            } else {
                                // 답을 맞추지 못하면 사망
                                alive = false
                            }
                        } label: {
                            // 선택지 레이블
                            ZStack {
                                Image("textbox")
                                    .resizable()
                                    .frame(width: 310, height: 60)
                                
                                Text(option.option)
                                    .font(.custom("Sam3KRFont", size: 24))
                            }
                        }
                    }
                }
                .foregroundColor(.white)
            }
        }
        // 퀴즈 클리어 - 랜덤게임 뷰로 넘어감
        else if alive && clearQuiz {
            RandomGameView()
        }
        // 사망 뷰로 넘어감
        else {
            DeathView(reasonText: "동굴 퀴즈 틀려서", tipText: "다음번엔 좀 더 꼼꼼히 설명을 읽어보세요.")
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quizModel: QuizModel())
    }
}

