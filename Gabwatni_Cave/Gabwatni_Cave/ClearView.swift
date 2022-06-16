//
//  ClearView.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/14.
//

import SwiftUI

struct ClearView: View {
    let size = UIScreen.main.bounds
    
    @State private var viewDidAppear: Bool = true
    @EnvironmentObject var vm: CardViewModel2
    @State var isClicked = false
    @State var isEnded = false
    @State var yposition :CGFloat = UIScreen.main.bounds.height + 1250
    @State var textAnimation = false
    var body: some View {
        ZStack {
            
                Image("end")
                    .resizable()
                    .frame(width: size.width, height: size.height, alignment: .center)
                    .scaledToFit()
                    .ignoresSafeArea()
                Text("클리어!")
                .font(.custom("Sam3KRFont", size: 60))
                .foregroundColor(.white)
                .position(x: size.width/2, y: size.height/8 * 3)
            
            Button{
                withAnimation {
                    isClicked = true
                }
               
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){(timer) in
                    yposition -= 0.7
                    print(yposition)
                    if yposition < -750{
                        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false){(timer) in
                            isEnded=true
                            
                        }
                      
                        //isClicked = false
                        
                        timer.invalidate()
                       
                    }
                }
            }label: {
                Image("treasure chest")
                    .resizable()
                    .frame(width: size.width/10, height: size.height/20, alignment: .center)
//                    .frame(width: size.width/5, height: size.height/10, alignment: .center)
                    .scaledToFit()
                    .ignoresSafeArea()
                    .shimmering()
            }
            .position(x: size.width/20 * 8, y: size.height/20 * 16)
            Image("clear character")
                .resizable()
                .frame(width: size.height/40 * 3, height: size.height/20 * 2, alignment: .center)
                .position(x: size.width/2, y: size.height/10 * 8)
            Color.black.opacity(isClicked ? 0.6 : 0)
                .ignoresSafeArea()
            if isClicked{
                
                VStack(spacing: 20){
                    HStack{Text("지금까지")
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.white)
                    }
                    HStack{Text("플레이 해주셔서 ")
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.white)
                    }
                    HStack{Text("감사합니다")
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.white)
                    }
                    HStack{Text("가봤니?-동굴")
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.white)
                    }
                    HStack{Text("클리어를 축하드립니다.")
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.white)
                    }
                    HStack{Text("가봤니?-심해편으로")
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.white)
                    }
                    HStack{Text("돌아오겠습니다.")
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.white)
                    }
                    HStack{Text("------특별 찬조출연------")
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.white)
                            .padding(.top,40)
                    }
                    VStack(spacing: 20){
                       Image("bat")
                                .resizable()
                                .scaledToFit()
                                .frame(width: size.height/2, height: size.height/3, alignment: .center)
                        
                        HStack{Image("salamander")
                                .resizable()
                                .scaledToFit()
                                .frame(width: size.height/2, height: size.height/3, alignment: .center)
                        }
                        HStack{Image("skeletonMapX")
                                .resizable()
                                .scaledToFit()
                                .frame(width: size.height/2, height: size.height/3, alignment: .center)
                        }
                        HStack{Image("dragonmillipede")
                                .resizable()
                                .scaledToFit()
                                .frame(width: size.height/2, height: size.height/3, alignment: .center)
                        }
                        HStack{Image("soundsnail")
                                .resizable()
                                .scaledToFit()
                                .frame(width: size.height/2, height: size.height/3, alignment: .center)
                        }
                        HStack{Text("------Directors------")
                                .font(.custom("Sam3KRFont", size: 30))
                                .foregroundColor(.white)
                                .padding(.top,40)
                        }
                    }
                    VStack(spacing : 20){
                        HStack{Text("김아무개")
                                .font(.custom("Sam3KRFont", size: 30))
                                .foregroundColor(.white)
                        }
                        HStack{Text("플레이 해주셔서 ")
                                .font(.custom("Sam3KRFont", size: 30))
                                .foregroundColor(.white)
                        }
                        HStack{Text("감사합니다")
                                .font(.custom("Sam3KRFont", size: 30))
                                .foregroundColor(.white)
                        }
                        HStack{Text("아무개씨")
                                .font(.custom("Sam3KRFont", size: 30))
                                .foregroundColor(.white)
                        }
                        HStack{Text("정신차려")
                                .font(.custom("Sam3KRFont", size: 30))
                                .foregroundColor(.white)
                        }
                        HStack{Text("가봤니?-심해편으로")
                                .font(.custom("Sam3KRFont", size: 30))
                                .foregroundColor(.white)
                        }
                        HStack{Text("병호아ㅑ~~~~")
                                .font(.custom("Sam3KRFont", size: 30))
                                .foregroundColor(.white)
                        }

                    }

                    
                }
                .position(x: UIScreen.main.bounds.width/2, y: yposition)
                
                if isEnded{
                    Button{
                        vm.flow = 7
                    }label: {
                        Text("-다음-")
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.white)
                            .opacity(textAnimation ? 1 : 0)
                    }
                    .position(x: size.width/2, y: size.height/10 * 6)
                    .onAppear(){
                        withAnimation(.spring().repeatForever()) {
                            textAnimation = true
                        }
                    }
                        
                    
                }
            }
            
            
        }
    }
}

struct ClearView_Previews: PreviewProvider {
    static var previews: some View {
        ClearView()
    }
}
