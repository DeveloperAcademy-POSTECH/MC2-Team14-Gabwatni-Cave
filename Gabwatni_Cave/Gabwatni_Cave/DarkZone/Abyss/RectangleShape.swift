//
//  RectangleShape.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/09.
//

import SwiftUI

struct RectangleButton: View {
    var color = Color.white
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(color)
            .shadow(radius: 5)
    }
}

struct RectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButton()
    }
}
