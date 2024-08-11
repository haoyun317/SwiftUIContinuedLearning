//
//  SoundsBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/11.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        //AVAudioPlayer(contentsOf: url) 會丟錯誤，所以需要一套do, try, catch
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sounds. \(error.localizedDescription)")
        }
    }
}

struct SoundsBcamp: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

#Preview {
    SoundsBcamp()
}
