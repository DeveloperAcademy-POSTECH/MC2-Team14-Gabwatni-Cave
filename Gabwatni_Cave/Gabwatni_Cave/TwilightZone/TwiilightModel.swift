//
//  TwiilightModel.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/11.
//

import Foundation
import AVFoundation
import Combine

final class TwilightModel: ObservableObject {
    @Published var twilightData: [Datas] = load("TwilightData.json")
    
    @Published var itemData: [String] = [""]
    @Published var itemTitle: String = ""
    
    @Published var nowPresent: String = ""
    @Published var presentItem: Bool = false
    
    @Published var str = ""
    @Published var toggle = false
    
    func tabItem(str: String) {
        for data in twilightData {
            if data.imageName == str {
                itemData = data.text.components(separatedBy: ",")
                itemTitle = data.title
                nowPresent = str
                presentItem = true
            }
        }
    }
    
//    func ges(strnum : Int){
//        str = ""
//        let startTime = Date().timeIntervalSince1970
//        let length = itemData[strnum].count
//        var index = 0
//        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [self] (timer) in
//            if strnum >= self.itemData.count - 1 {timer.invalidate()}
//            AudioServicesPlaySystemSound(1306)
//            str += String((itemData[strnum][itemData[strnum].index(itemData[strnum].startIndex, offsetBy: index)]))
//            index+=1
//            if index == length{
//                timer.invalidate()
//
//            }
//            if(toggle){
//                timer.invalidate()
//                str += itemData[strnum].substring(from: index, to: length-1)
//                toggle.toggle()
//
//            }
//
//        }
//
//
//    }
}

struct Datas: Hashable, Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case title
        case imageName
        case text
    }
    
    var id = UUID()
    var title: String
    var imageName: String
    var text: String
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
