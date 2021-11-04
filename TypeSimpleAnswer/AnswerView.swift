//
//  AnswerView.swift
//  AnswerView
//
//  Created by Leonore Yardimli on 2021/10/22.
//

import SwiftUI


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
								SoundManager.instance.playSound(sound: lessonToday.myTheme.finishedLessonAudio)
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
								SoundManager.instance.playSound(sound: lessonToday.myTheme.correctAnswerAudio)
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
									SoundManager.instance.playSound(sound: lessonToday.myTheme.wrongAnswerAudio)
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
