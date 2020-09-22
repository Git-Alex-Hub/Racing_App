import Foundation
import AVKit

private let gameAudioPath = Bundle.main.path(forResource: "Game_Sound", ofType: "mp3")
private let gameAudioURL = URL(fileURLWithPath: gameAudioPath!)
let gameAudioPlayer = try? AVAudioPlayer(contentsOf: gameAudioURL)

private let crashAudioPath = Bundle.main.path(forResource: "Crash", ofType: "mp3")
private let crashAudioURL = URL(fileURLWithPath: crashAudioPath!)
let crashAudioPlayer = try? AVAudioPlayer(contentsOf: crashAudioURL)

private let gameOverAudioPath = Bundle.main.path(forResource: "Game_Over", ofType: "mp3")
private let gameOverAudioURL = URL(fileURLWithPath: gameOverAudioPath!)
let gameOverAudioPlayer = try? AVAudioPlayer(contentsOf: gameOverAudioURL)


