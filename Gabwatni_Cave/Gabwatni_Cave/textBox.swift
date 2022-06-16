//
//  TextBox.swift
//  flashtesst
//
//  Created by dohankim on 2022/06/10.
//

import SwiftUI

struct textBox: View {
    var name : String
    var text : String
    var body: some View {
        ZStack{
            Text(text)
                .font(.custom("Sam3KRFont", size: 20))
                .foregroundColor(.white)
    //                .background(Color.gray)
                .multilineTextAlignment(.leading)
                .frame(width: 250, height: 100, alignment: .leading)
    //                .border(Color.white)
    //                .padding(.top,100)
                .overlay( // 뷰를 겹치게 하여 border 설정, 라운드 처리를 할 경우 overlay를 통해 border 처리를 해주어야 한다.
                        textboxView()
                        
                    )
                .position(x: UIScreen.main.bounds.width/2
                          , y: UIScreen.main.bounds.height/9 * 7)
            
            Text(name)
                    .font(.custom("Sam3KRFont", size: 20))
                    .foregroundColor(.white)
                    .position(x: UIScreen.main.bounds.width/4
                              , y: UIScreen.main.bounds.height/10 * 7)
        }
       
    }
}

struct textBox_Previews: PreviewProvider {
    static var previews: some View {
        textBox(name: "동달", text: "안녕")
    }
}

struct textboxView : View{
    var body: some View{
        ZStack{
            Image("textbox")
        }
    }
}
