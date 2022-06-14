//
//  SoundEffectView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/14.
//

import SwiftUI
import AVKit

class SoundSetting: ObservableObject {
    
    static let instance = SoundSetting()
    var player: AVAudioPlayer?
    
    func playStartZoneBGM() {
        guard let url = Bundle.main.url(forResource: "rain", withExtension: ".mp3") else { return }
        
        do{
        player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
    
    func playEntranceZoneBGM() {
        guard let url = Bundle.main.url(forResource: "startZoneBGM", withExtension: ".mp3") else { return }
        
        do{
        player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
}
}

