//
//  QuestionView.swift
//  QuestionView
//
//  Created by Leonore Yardimli on 2021/10/22.
//

import SwiftUI

struct QuestionView: View {
	@State private var goToView = "QuestionView"
	@State private var answer:String = ""
	@EnvironmentObject var lessonToday: LessonToday
	@State private var questionText = "Question1:"
	
	var body: some View {
		if self.goToView == "QuestionView" {
			VStack{
				Spacer()
				
				HStack{
					Spacer()
					if let image = NSImage(contentsOf: URL(fileURLWithPath: FileManager.default.homeDirectoryForCurrentUser.path+"/Ege/class_writing/macos/TypeSimpleAnswer/"+lessonToday.quiz[lessonToday.currentLessonAt].picture)) {
						Image(nsImage: image)
							.resizable()
							.aspectRatio(contentMode: .fit)
							.shadow(color:.black, radius: 3, x:1, y: 1)
							.border(lessonToday.myTheme.contentTextColor, width: 5)
							.frame(width:400, height:400)
					}
					Spacer()
						.frame(width:20)
					VStack{
						Text(self.questionText)
							.font(.system(size: 60))
							.foregroundColor(lessonToday.myTheme.contentTextColor)
							.padding(10)
						
						TextField("對/不對", text: self.$answer)
							.foregroundColor(Color.black)
							.font(.system(size: 60))
							.padding(15)
							.frame(width:400)
							.textFieldStyle(PlainTextFieldStyle())
							.background(
								RoundedRectangle(cornerRadius: 25, style: .continuous)
									.foregroundColor(lessonToday.myTheme.contentButtonBackground.opacity(lessonToday.myTheme.textInputBackgroundOpacity))
							)
							.overlay(
								RoundedRectangle(cornerRadius: 25, style: .continuous)
									.strokeBorder(lessonToday.myTheme.contentTextColor, lineWidth: 1)
							)
						Spacer()
							.frame(height:20)
						
						Button(action: {
							if self.answer == lessonToday.quiz[lessonToday.currentLessonAt].answer {
								lessonToday.quiz[lessonToday.currentLessonAt].status = 1
							}else{
								lessonToday.quiz[lessonToday.currentLessonAt].status = -1
							}
							withAnimation{
							self.goToView = "AnswerView"
							}
						}) {
							RoundedRectangle(cornerRadius: 22, style: .continuous)
								.strokeBorder(lessonToday.myTheme.contentButtonStroke,lineWidth: 1)
								.background(
									RoundedRectangle(cornerRadius: 22, style: .continuous)
										.foregroundColor(lessonToday.myTheme.contentButtonBackground.opacity(lessonToday.myTheme.contentButtonOpacity)))
								.frame(width:180,height:60)
								.overlay(
									Text("回答")
										.font(.system(size: 40))
										.fontWeight(.semibold)
										.foregroundColor(lessonToday.myTheme.contentTextColor)
								)
						}
						.buttonStyle(PlainButtonStyle())
					}
					Spacer()
				}
				
				Spacer()
			}
			.background(
				Image(lessonToday.myTheme.contentPageBackground)
					.resizable()
			)
			.onAppear{
				if lessonToday.quiz[lessonToday.currentLessonAt].status == 1 {
					lessonToday.currentLessonAt = lessonToday.currentLessonAt + 1
				}
				self.questionText = lessonToday.quiz[lessonToday.currentLessonAt].asking
			}
		}else{
		AnswerView().transition(.move(edge: .leading))
		}
	}
}

struct QuestionView_Previews: PreviewProvider {
	static var previews: some View {
		QuestionView().environmentObject(LessonToday())
	}
}

