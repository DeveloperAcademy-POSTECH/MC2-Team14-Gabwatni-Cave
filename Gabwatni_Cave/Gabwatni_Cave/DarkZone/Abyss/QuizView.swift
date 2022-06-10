//
//  QuizView.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/09.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var quizModel: QuizModel
    
    @State var selectedAnswerIndex: Int?
    @State var indexOfQuestion = 0
    @State var indexOfQuiz = 0
    
    @State var alive = true
    
    
    var body: some View {
        if alive {
            ZStack {
                Rectangle()
                    .overlay(
                        Image("minigame dragon")
                            .resizable()
                    )
                    .foregroundColor(.black)
                    .ignoresSafeArea()

                
                VStack {
                    Text(quizModel.quizzes[indexOfQuestion].question)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                    
                    ForEach(0..<quizModel.quizzes[indexOfQuestion].answers.count) { index in
                        Button {
                            selectedAnswerIndex = index
                            
                            if selectedAnswerIndex == quizModel.quizzes[indexOfQuestion].correctIndex {
                                indexOfQuestion += 1
                                indexOfQuiz += 1
                            } else {
                                alive = false
                            }
                        } label: {
                            ZStack {
                                RectangleButton()
                                    .frame(width: 300, height: 48)
                                Text(quizModel.quizzes[indexOfQuiz].answers[index])
                                    .font(.largeTitle)
                            }
                        }
                        .tint(.black)
                        .disabled(!alive)
                    }
                }
            }
        } else {
            DeathView()
        }
 
       
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizModel())
    }
}

