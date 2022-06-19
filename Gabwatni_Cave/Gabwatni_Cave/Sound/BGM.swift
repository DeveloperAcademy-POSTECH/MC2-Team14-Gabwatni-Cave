//
//  SoundEffectView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/14.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?
var audioPlayer2: AVAudioPlayer?
var audioPlayer3: AVAudioPlayer?
var audioPlayer4: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default, options: .mixWithOthers)
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops =  -1
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

func playSoundEffect(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default, options: .mixWithOthers)
            
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer2?.volume = 2.5
            audioPlayer2?.play()
        } catch {
            print("ERROR")
        }
    }
}
func playSoundEffect2(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default, options: .mixWithOthers)
            
            audioPlayer4 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer4?.volume = 2.5
            audioPlayer4?.play()
        } catch {
            print("ERROR")
        }
    }
}

func playSoundBat(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default, options: .mixWithOthers)
            
            audioPlayer3 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer3?.play()
        } catch {
            print("ERROR")
        }
    }
}


func playSoundsnail(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default, options: .mixWithOthers)
            
            audioPlayer3 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer3?.numberOfLoops = 0
            audioPlayer3?.play()
           
        } catch {
            print("ERROR")
        }
    }
}


