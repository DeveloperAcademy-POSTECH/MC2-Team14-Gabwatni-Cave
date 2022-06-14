//
//  QuizView.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/09.
//

import SwiftUI
// TODO: 문제 다 맞추면 보스 죽는 뷰(표정 다른 새로운 이미지 필요할듯) 나오고 엔딩 화면
// TODO: 코드 정리 필요

// 타이머 기능 넣고싶음 (문제당 5초 정도)
// 보스 테두리 회색으로 하면 좋을것 같음 > 다 흰색이라 가독성이 떨어지는듯

// Abyss에서 상호작용 요소 누르면 이 뷰가 나오게 해야함

struct QuizView: View {
    @ObservedObject var quizModel: QuizModel
    
    @State var alive = true
    @State private var clearQuiz = false
    @State private var currentQuizIndex = 0
    
    var body: some View {
        if alive && !clearQuiz {
            ZStack {
                // 배경사진
                Rectangle()
                    .ignoresSafeArea()
                
                VStack {
                    if currentQuizIndex == 0 {
                        // 첫 번째 질문일때의 보스 대사
                        Text("동굴에 관한 퀴즈를 맞춰봐라!")
                            .font(.custom("Sam3KRFont", size: 36))
                            
                    } else if currentQuizIndex == 1 {
                        // 두 번째 질문일때의 보스 대사
                        Text("헉! 그렇다면 이건 어떠냐!")
                            .font(.custom("Sam3KRFont", size: 36))
                           
                    } else if currentQuizIndex == 2 {
                        // 세 번째(마지막) 질문일때의 보스 대사
                        Text("이럴수가... 마지막이다!")
                            .font(.custom("Sam3KRFont", size: 36))
                        
                    }
                    
                    // 질문
                    Text(quizModel.shuffledQuizzes[currentQuizIndex].question)
                        .font(.custom("Sam3KRFont", size: 28))
                        .padding(.top)
                    
                    LottieView("boss")
                .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5)
                    
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
        } else if alive && clearQuiz {
            RandomGameView()
        } else {
            // 사망 뷰로 넘어감
            TempDeathView()
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quizModel: QuizModel())
    }
}

