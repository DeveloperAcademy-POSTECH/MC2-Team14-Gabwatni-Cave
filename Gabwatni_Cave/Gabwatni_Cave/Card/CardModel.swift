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

class CardViewModel2: ObservableObject {
    @Published var imageName: String = ""
    @Published var imageTitle: String = ""
    @Published var imageText: [String] = []
    @Published var inputString = ""
    @Published var textEnd = true
    @Published var stringArrayIndex = 0
    
    let CardData : [String : Array<String>] = [
        "bat" : ["박쥐", "동굴 생태계에서 없어서는 안 될 존재.,밤에는 동굴 밖에서 먹이를 잡아먹고 동굴 내부에 배설하는데 이 배설물(구아노)은 동굴 생물에게 중요한 영양분을 제공한다."],
        "arachnocampa" : ["아라크노캄파 루미노사", "유충일 때 몸에서 밝은 빛을 발하여 동굴 반딧불이라 불린다.,동굴 천장의 끈적이는 실로 둥지를 만든다.,반짝이는 빛으로 먹이를 유인해서 실로 잡아당겨 먹이를 포획한다."],
        "dragonmillipede" : ["드래곤 밀리패드", "최대 길이는 3cm인 절지동물이다.,주로 낙엽 사이에 살지만 몇몇 종은 동굴에서도 살며 자신을 보호하기 위해서 시안화수소를 내뿜기도한다."],
        "baconsheet" : ["커튼종유석(베이컨시트)","물이 넓게 퍼져 흘러내리면서 동굴 천장 혹은 벽에 형성되는 것으로,마치 창문에 달아놓은 커튼 모양이다.,베이컨 시트라는 말은 마치 삼겹살을 닮았다는데서 붙여진 이름이다."],
        "sodastraw" : ["종유관","지하수가 석회동굴의 천장에서 맺히며 석회질이 천장에 수직으로 매달린 빨대 모양을 형성한 것."],
        "corrosionhole" : ["용식공","동굴 천장에 패인 구멍 형태로 발달된 지형으로,석회수가 석회암을 부식시키는 용식작용으로 인해 반원형의 용식공이 형성된다."],
        "transparent snail" : ["투명 달팽이","어두운 곳에 생육하는 특성때문에 다른 달팽이보다 눈이 짧고 투명한 등껍질을 가지고 있다.,움직임이 거의 없고 이동시에는 흐르는 물을 타고 이동한다."],
        "salamander" : ["동굴 도룡뇽","눈이 퇴화하여 피부 밑에 파묻혀 있고 색소가 없는 피부가 특징이다.,자신의 신체를 분해하여 양분을 공급받고 불로불사할 수 있다."],
        "cavecoral" : ["동굴 산호","동굴산호는 석화 종유관과 같은 동굴생성물로 동굴 팝콘이라 부르기도 한다.,바다에서 살고 있는 산호와 모양이 비슷해서 이런 이름이 붙었으며 주로 방해석과 아라고나이트로 이루어져 있다."],
        "stalactite" : ["종유석","동굴 천정에서 지하수가 물방울로 떨어질 때,지하수에 용해되어 있던 탄산칼슘 성분이,천정의 물방울이 떨어지는 지점에 집적되어,시간이 흐룰수록 동굴바닥쪽으로 성장해 가는 고드름 모양의 석회 기둥."]
    ]
    
    init() {
        //loadCardData()
    }
    
    func loadCardData(imageName: String) {
        self.imageName = imageName
        self.imageTitle = (CardData[imageName] ?? ["no title", "no text"])[0]
        self.imageText = (CardData[imageName] ?? ["no title", "no text"])[1].components(separatedBy: ",")
        self.imageText.append(" ")
    }
    
    func talkOnTextBox (stringArray: [String], inputIndex: Int){
        inputString = ""
        let length = stringArray[inputIndex].count
        var index = 0

        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            if inputIndex >= stringArray.count - 1 {timer.invalidate()}
            AudioServicesPlaySystemSound(1306)
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
