//
//  SoundManager.swift
//  SoundManager
//
//  Created by Leonore Yardimli on 2021/11/3.
//

import Foundation
import SwiftUI
import AVKit

class SoundManager {
	static let instance = SoundManager()
	var player: AVAudioPlayer?
	//var moviePlayer: AVPlayer?
	enum SoundOption: String{
		case correctAnswer = "Bright Right Answer 4"
		case wrongAnswer = "Cartoon Brass Fail"
		case finished = "Cartoon Big Win"
	}
	
	func playSound(sound:String){
		guard let url = Bundle.main.url(forResource: sound, withExtension: ".wav") else {
			return
		}
		
		do{
			player = try AVAudioPlayer(contentsOf: url)
			player?.play()
		}catch let error{
			print("error playing sound. \(error.localizedDescription)")
		}
	}
	/*
	enum MovieOption: String{
		case finishLesson = "clapping_pingu"
	}*/
	
	/*
	func playSound(sound:SoundOption){
		guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") else {
			return
		}
		
		do{
			player = try AVAudioPlayer(contentsOf: url)
			player?.play()
		}catch let error{
			print("error playing sound. \(error.localizedDescription)")
		}
	}
	 */
	
	/*
	func playMovie(movie:MovieOption){
		guard let url = Bundle.main.url(forResource: movie.rawValue, withExtension: ".mp4") else {
			return
		}
		
		do{
			moviePlayer = try AVPlayer(url: url)
			moviePlayer?.play()
		}catch let error{
			print("error playing sound. \(error.localizedDescription)")
		}
	}*/
}
