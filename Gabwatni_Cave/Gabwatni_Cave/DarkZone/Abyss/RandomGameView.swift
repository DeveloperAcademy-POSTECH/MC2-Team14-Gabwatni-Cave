//
//  RandomGameView.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/10.
//

import SwiftUI

struct RandomGameView: View {
    @EnvironmentObject var vm: CardViewModel2
    
    @State var bossChoice = Int.random(in: 1...3)
    
    @State private var clearRandomGame = false
    @State private var myChoice = 0
    
    @State private var isEnded: Bool = false
    
    var texts: String {
        var tempString: String = ""
        
        if myChoice == 0 {
            tempString = "게임을 시작하지...\n가위 바위 보!"
        }
        else if myChoice == bossChoice {
            tempString = "비겼군...\n다시 도전해라!"
        }
        else if myChoice == 1 && bossChoice == 3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isEnded = true
                withAnimation(.easeInOut(duration: 1.1)){
                    vm.flow = 5
                }
                
            }
            tempString = "이걸 이기네..."
        }
        else if myChoice == 2 && bossChoice == 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isEnded = true
                withAnimation(.easeInOut(duration: 1.1)){
                    vm.flow = 5
                }
                
            }
            tempString = "내가 지다니..."
        }
        else if myChoice == 3 && bossChoice == 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isEnded = true
                withAnimation(.easeInOut(duration: 1.1)){
                    vm.flow = 5
                }
                
            }
            tempString = "나를 이기다니..."
        }
        else if myChoice == 1 && bossChoice == 2 {
            vm.flow = 6
        }
        else if myChoice == 2 && bossChoice == 3 {
            vm.flow = 6
        }
        else if myChoice == 3 && bossChoice == 1 {
            vm.flow = 6
        }
        return tempString
    }
    
    var body: some View {
        // 기본 뷰
        if clearRandomGame == false {
            // 배경
            ZStack{
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                VStack{
                    // 보스 대사
                    Text(texts)
                    //Text("게임을 시작하지...\n가위 바위 보!")
                        .font(.custom("Sam3KRFont", size: 36))
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    LottieView("boss")
                        .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5)
                    
                    // 가위 바위 보 선택지
                    Group {
                        Button {
                            myChoice = 1
                            bossChoice = Int.random(in: 1...3)
                        } label: {
                            ZStack {
                                Image("textbox")
                                    .resizable()
                                    .frame(width: 310, height: 60)
                                
                                Text("가위")
                                    .font(.custom("Sam3KRFont", size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Button {
                            myChoice = 2
                            bossChoice = Int.random(in: 1...3)
                        } label: {
                            ZStack {
                                Image("textbox")
                                    .resizable()
                                    .frame(width: 310, height: 60)
                                
                                Text("바위")
                                    .font(.custom("Sam3KRFont", size: 24)).foregroundColor(.white)
                            }
                        }
                        
                        Button {
                            myChoice = 3
                            bossChoice = Int.random(in: 1...3)
                        } label: {
                            ZStack {
                                Image("textbox")
                                    .resizable()
                                    .frame(width: 310, height: 60)
                                
                                Text("보")
                                    .font(.custom("Sam3KRFont", size: 24)).foregroundColor(.white)
                            }
                        }
                    }.opacity(isEnded ? 0 : 1)
                   
                    
                }
            }
        }
        // 가위바위보 비겼을때 뷰
//        else if myChoice == bossChoice && clearRandomGame == false {
//            ZStack {
//                // 배경
//                Rectangle()
//                    .foregroundColor(.black)
//                    .ignoresSafeArea()
//
//                VStack {
//                    // 보스 대사
//                    Text("비겼군...\n다시 도전해라!")
//                        .font(.custom("Sam3KRFont", size: 36))
//                        .padding(.top)
//
//                    LottieView("boss")
//                        .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5)
//
//
//                    // 가위 바위 보 선택지
//                    Button {
//                        myChoice = 1
//                        bossChoice = Int.random(in: 1...3)
//                    } label: {
//                        ZStack {
//                            Image("textbox")
//                                .resizable()
//                                .frame(width: 310, height: 60)
//
//                            Text("가위")
//                                .font(.custom("Sam3KRFont", size: 24))
//                        }
//                    }
//
//                    Button {
//                        myChoice = 2
//                        bossChoice = Int.random(in: 1...3)
//                    } label: {
//                        ZStack {
//                            Image("textbox")
//                                .resizable()
//                                .frame(width: 310, height: 60)
//
//                            Text("바위")
//                                .font(.custom("Sam3KRFont", size: 24))
//                        }
//                    }
//
//                    Button {
//                        myChoice = 3
//                        bossChoice = Int.random(in: 1...3)
//                    } label: {
//                        ZStack {
//                            Image("textbox")
//                                .resizable()
//                                .frame(width: 310, height: 60)
//
//                            Text("보")
//                                .font(.custom("Sam3KRFont", size: 24))
//                        }
//                    }
//                }
//                .foregroundColor(.white)
//            }
//        }
        // 가위로 이겼을때 뷰
//        else if myChoice == 1 && bossChoice == 3 && clearRandomGame == false {
//            ZStack {
//                // 배경
//                Rectangle()
//                    .foregroundColor(.black)
//                    .ignoresSafeArea()
//
//                VStack {
//                    // 보스 대사
//                    Text("이걸 이기네...")
//                        .font(.custom("Sam3KRFont", size: 36))
//                        .foregroundColor(.white)
//                        .padding(.top)
//                    LottieView("boss")
//                        .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5)
//
//
//                }
//                .foregroundColor(.white)
//            }
//            .onAppear {
//                playSound(sound: "end", type: ".mp3")
//                withAnimation(.easeIn(duration: 2).delay(1)) {
//                    clearRandomGame = true
//                }
//            }
//
//        }
//        // 바위로 이겼을때 뷰
//        else if myChoice == 2 && bossChoice == 1 && clearRandomGame == false {
//            ZStack {
//                // 배경
//                Rectangle()
//                    .foregroundColor(.black)
//                    .ignoresSafeArea()
//
//                VStack {
//                    // 보스 대사
//                    Text("내가 지다니...")
//                        .font(.custom("Sam3KRFont", size: 36))
//                        .padding(.top)
//                        .foregroundColor(.white)
//
//                    LottieView("boss")
//                        .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5)
//
//                }
//                .onAppear {
//                    playSound(sound: "end", type: ".mp3")
//                    withAnimation(.easeIn(duration: 2).delay(1)) {
//                        clearRandomGame = true
//                    }
//                }
//            }
//        }
//        // 보로 이겼을때 뷰
//        else if myChoice == 3 && bossChoice == 2 && clearRandomGame == false {
//            ZStack {
//                // 배경
//                Rectangle()
//                    .foregroundColor(.black)
//                    .ignoresSafeArea()
//
//                VStack {
//                    // 보스 대사
//                    Text("나를 이기다니...")
//                        .font(.custom("Sam3KRFont", size: 36))
//                        .padding(.top)
//                        .foregroundColor(.white)
//                    LottieView("boss")
//                        .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5)
//                }
//            }
//            .onAppear {
//                playSound(sound: "end", type: ".mp3")
//                withAnimation(.easeIn(duration: 2).delay(1)) {
//                    clearRandomGame = true
//                }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
//                    isEnded.toggle()
//                }
//            }
//            .opacity(isEnded ? 0 : 1)
//        }
        // 이기고 나면 클리어 뷰로 이동
//        else if clearRandomGame == true {
//            var ler = sddf()
//        }
        // 지면 사망뷰로 이동
//        else {
//            DeathView(reasonText: "가위 바위 보 져서", tipText: "다음엔 더 잘해보시길")
//        }
    }
    
//    func sddf(){
//        vm.flow = 5
//    }
}

struct RandomGameView_Previews: PreviewProvider {
    static var previews: some View {
        RandomGameView()
    }
}
