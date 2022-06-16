//
//  CardModel.swift
//  Gabwatni_Cave
//
//  Created by DongKyu Kim on 2022/06/09.
//
// JSON 형식으로 가져오기?


import Foundation
import AVFoundation

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

final class CardViewModel2: ObservableObject {

    @Published var flow: Int = -1
    
    @Published var isSound: Bool = false
    
    @Published var fakeDie: Bool = false
    @Published var isBossShowingBefore: Bool = false
    @Published var isBossTalk: Bool = false
    
    
    @Published var imageName: String = ""
    @Published var imageTitle: String = ""
    @Published var imageText: [String] = []
    @Published var inputString: String = ""
    @Published var textEnd: Bool = true
    @Published var stringArrayIndex: Int = 0
    
    @Published var dragOffset = CGSize.zero
    @Published var dragOffset2 = CGSize.zero
    
    var itemDict : [String : Bool] = [
        "bat" : false, "salamander" : false, "dragonmillipede" : false, "arachnocampa" : false, "cavecoral" : false, "water" : false, "pillar" : false]
    
    let CardData : [String : Array<String>] = [
        "bat" : ["박쥐", "동굴 생태계에서 필수적인 존재|밤에는 동굴 밖에서 먹이를 잡아먹고 동굴 내부에 배설|이 배설물이 동굴 생물에게 중요한 영양분이 됨"],
        "arachnocampa" : ["아라크노캄파", "몸에서 밝은 빛을 발하여 동굴 반딧불이라고도 불림|천장에 끈적이는 실로 둥지를 만듦|빛으로 먹이를 유인한 뒤 실로 잡아당겨 사냥"],
        "dragonmillipede" : ["드래곤 밀리패드", "주로 낙엽 사이에 사는 최대 길이 3cm의 절지동물|몇몇 종은 동굴에서도 살며 자신을 보호하기 위해 시안화수소를 내뿜음"],
        "baconsheet" : ["커튼 종유석","물이 넓게 퍼져 흘러내리면서 동굴 천장 혹은 벽에 커튼 모양으로 형성된 종유석"],
        "sodastraw" : ["종유관","지하수가 석회동굴의 천장에 맺혀 생김|이때 생긴 석회질이 천장에 수직으로 매달린 빨대 모양을 형성한 것"],
        "corrosionhole" : ["용식공","동굴 천장에 패인 구멍 형태로 발달된 지형|석회수가 석회암을 부식시키는 용식작용때문에 반원형의 용식공이 형성"],
        "transparent snail" : ["투명 달팽이","어두운 곳에 살기때문에 다른 달팽이보다 눈이 짧고 투명한 등껍질을 가짐|움직임이 거의 없고 움직일때는 흐르는 물을 타고 이동"],
        "salamander" : ["텍사스동굴도룡뇽","색소가 없는 피부 밑에 퇴화한 눈이 파묻힌게 특징|자신의 신체를 분해하여 양분을 공급받아 불로불사할 수 있음"],
        "cavecoral" : ["동굴 산호","바다의 산호와 모양이 비슷해 이런 이름이 붙음|동굴 팝콘이라고도 불리며 방해석과 아라고나이트로 이루어짐"],
        "stalactite" : ["종유석","천정에서 지하수가 떨어질 때 지하수의 탄산칼슘 성분이 천장에 맺혀|시간이 흐를수록 바닥쪽으로 성장해 가는 고드름 모양의 석회 기둥"],
        "water" : ["동굴 물", "산성을 띄며 생명체들의 시체와 배설물로 인해 더러움"],
        "pillar" : ["석주", "종유석과 석순이 자라나다 만난 기둥"],
    ]
    
    init() {
        //loadCardData()
    }
    
    func loadCardData(imageName: String) {
        self.imageName = imageName
        self.imageTitle = (CardData[imageName] ?? ["no title", "no text"])[0]
        self.imageText = (CardData[imageName] ?? ["no title", "no text"])[1].components(separatedBy: "|")
        self.imageText.append(" ")
    }
    
    func talkOnTextBox (stringArray: [String], inputIndex: Int){
        inputString = ""
        let length = stringArray[inputIndex].count
        var index = 0

        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            if inputIndex >= stringArray.count - 1 {timer.invalidate()}
            AudioServicesPlaySystemSound(1104)
            self.inputString += String(stringArray[inputIndex][stringArray[inputIndex].index(stringArray[inputIndex].startIndex, offsetBy: index)])
                index+=1
            
            if index == length{
                timer.invalidate()
                self.textEnd = true
                if self.stringArrayIndex == stringArray.count - 1 {
                    // textEnd, 배열 인덱스
                    self.textEnd = false
                }
            }
        }
        if self.stringArrayIndex < stringArray.count - 1 {
            self.stringArrayIndex += 1
            self.textEnd = false
        } else if self.stringArrayIndex == stringArray.count - 1 {
            // textEnd, 배열 인덱스
            self.textEnd = false
        }
        
    }
}
