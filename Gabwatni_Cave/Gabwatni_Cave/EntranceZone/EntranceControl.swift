//
//  EntranceControl.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/09.
//

import SwiftUI


struct EntranceControl: View {
    @State var entranceControl = 0
    var body: some View {
        if entranceControl == 0{
            EntranceView(flow: $entranceControl)
        }
        else if entranceControl == 1{
            EntranceView_stone(flow: $entranceControl)
        }
        else if entranceControl == 2{
            EntranceView_info(flow: $entranceControl)
        }
    }
}

struct EntranceControl_Previews: PreviewProvider {
    static var previews: some View {
        EntranceControl()
    }
}
