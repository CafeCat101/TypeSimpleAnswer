//
//  AnswerView.swift
//  AnswerView
//
//  Created by Leonore Yardimli on 2021/10/22.
//

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
	/*
	enum MovieOption: String{
		case finishLesson = "clapping_pingu"
	}*/
	
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

struct AnswerView: View {
	@EnvironmentObject var lessonToday: LessonToday
	@State private var goToView = "AnswerView"
	
	var body: some View {
		if self.goToView == "AnswerView" {
			VStack{
				Spacer()
				
				if (lessonToday.quiz[lessonToday.currentLessonAt].status == 1) && (lessonToday.currentLessonAt == lessonToday.quiz.count-1){
					HStack{
						//SoundManager.instance.playMovie(movie: .finishLesson)
						/*ideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "clapping_pingu", withExtension: "mp4")!))
							.frame(width: 280, height:200)*/
						Image("finish_lesson")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width:300)
							.onAppear{
								SoundManager.instance.playSound(sound: .finished)
							}
					}
					HStack{
						Spacer()
						Text("做完了！")
							.font(.system(size: 50))
							.fontWeight(.semibold)
							.foregroundColor(.replyButtonText)
							.padding(10)
						Spacer()
					}
				}else{
					if lessonToday.quiz[lessonToday.currentLessonAt].status == 1 {
						//correct answer layout
						Image("correct_answer")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width:300)
							.onAppear{
								SoundManager.instance.playSound(sound: .correctAnswer)
							}
						HStack{
							Spacer()
							Button(action: {
								withAnimation{
									self.goToView = "QuestionView"
								}
							}) {
								Circle()
									.strokeBorder(Color.yellow,lineWidth: 1)
									.background(Circle().foregroundColor(.arrowButton.opacity(0.6)))
									.frame(width:70,height:70)
									.overlay(
										Image("arrow_right_md")
											.resizable()
											.scaleEffect(0.6)
									)
							}
							.buttonStyle(PlainButtonStyle())
							Spacer()
						}
					}else{
						//wrong answer layout
						HStack{
							Spacer()
							Button(action: {
								withAnimation{
									self.goToView = "QuestionView"
								}
							}) {
								Circle()
									.strokeBorder(Color.yellow,lineWidth: 1)
									.background(Circle().foregroundColor(.arrowButton.opacity(0.6)))
									.frame(width:70,height:70)
									.overlay(
										Image("arrow_left_md")
											.resizable()
											.scaleEffect(0.6)
									)
							}
							.buttonStyle(PlainButtonStyle())
							Image("wrong_answer")
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width:300)
								.onAppear{
									SoundManager.instance.playSound(sound: .wrongAnswer)
								}
							Spacer()
						}
					}
				}
				
				
				Spacer()
			}
			.background(
				Image("old_paper_background2")
					.resizable()
			)
		}else{
			QuestionView().transition(.move(edge: .leading))
		}
		
		
	}
}

struct AnswerView_Previews: PreviewProvider {
	static var previews: some View {
		AnswerView().environmentObject(LessonToday())
	}
}
