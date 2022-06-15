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
    
    @State var isClicked = false
    
    @State var yposition :CGFloat = UIScreen.main.bounds.height + 200
    var body: some View {
        ZStack {
            
            Button{
                isClicked = true
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){(timer) in
                    yposition -= 0.2
                    
                    if yposition < -200{
                        isClicked = false
                        timer.invalidate()
                    }
                }
            }label: {
                Image("clear view image")
                    .resizable()
                    .frame(width: size.width, height: size.height, alignment: .center)
                    .scaledToFit()
                    .ignoresSafeArea()
            }
           
            if isClicked{
                Color.black.opacity(0.6)
                VStack(spacing: 20){
                    HStack{Text("지금까지")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    HStack{Text("플레이 해주셔서 ")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    HStack{Text("감사합니다")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    HStack{Text("가봤니?-동굴편")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    HStack{Text("클리어를 축하드립니다.")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    HStack{Text("가봤니?-북한편으로")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    HStack{Text("돌아오겠습니다.")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .position(x: UIScreen.main.bounds.width/2, y: yposition)
                
            }
            
        }
    }
}

struct ClearView_Previews: PreviewProvider {
    static var previews: some View {
        ClearView()
    }
}
