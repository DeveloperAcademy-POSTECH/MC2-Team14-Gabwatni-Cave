//
//  CardModel.swift
//  Gabwatni_Cave
//
//  Created by DongKyu Kim on 2022/06/09.
//
// JSON 형식으로 가져오기?


import Foundation

struct Card: Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case title
        case imageName
        case text
    }
    
    var id = UUID()
    var title: String
    // var isShowCard: Bool
    var imageName: String
    var text: String
}


class CardViewModel: ObservableObject {
    @Published var cards = [Card]()
    
    init() {
        loadCardData()
    }
    
    func loadCardData() {
        guard let url = Bundle.main.url(forResource: "CardData", withExtension: "json") else {
            print("JSON file not found")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            
            if let cards = try? JSONDecoder().decode([Card].self, from: data)
            {
                self.cards = cards
            }
        } catch {
            print("Invalid Data")
        }
        
       
    }

}

public var CardData : [String : Array<String>] =
["dongdal" : ["동달이", "동달이 텍스트"]]
