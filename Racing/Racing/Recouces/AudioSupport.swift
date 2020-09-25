import Foundation
import AVKit

private let turnAudioPath = Bundle.main.path(forResource: "Turn_Sound", ofType: "mp3")
private let turnAudioURL = URL(fileURLWithPath: turnAudioPath!)
let turnAudioPlayer = try? AVAudioPlayer(contentsOf: turnAudioURL)

private let crashAudioPath = Bundle.main.path(forResource: "Crash", ofType: "mp3")
private let crashAudioURL = URL(fileURLWithPath: crashAudioPath!)
let crashAudioPlayer = try? AVAudioPlayer(contentsOf: crashAudioURL)
