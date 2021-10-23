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
	@EnvironmentObject var lesson: Lesson
	@State private var questionText = "Question1:"
	
	var body: some View {
		if self.goToView == "QuestionView" {
			VStack{
				Spacer()
				HStack{
					Spacer()
					Text(self.questionText)
						.font(.system(size: 50))
						.foregroundColor(.replyButtonText)
						.padding(10)
					Spacer()
				}
				TextField("對/不對", text: self.$answer)
					.foregroundColor(Color.black)
					.font(.system(size: 50))
					.padding(15)
					.frame(width:400)
					.textFieldStyle(PlainTextFieldStyle())
					.background(
						RoundedRectangle(cornerRadius: 25, style: .continuous)
							.foregroundColor(.replyButton.opacity(0.3))
					)
					.overlay(
						RoundedRectangle(cornerRadius: 25, style: .continuous)
							.strokeBorder(Color.replyButtonText, lineWidth: 1)
					)
				Spacer()
					.frame(height:20)
				Button(action: {
					if self.answer == lesson.quiz[lesson.currentLessonAt].answer {
						lesson.quiz[lesson.currentLessonAt].status = 1
					}else{
						lesson.quiz[lesson.currentLessonAt].status = -1
					}
					withAnimation{
					self.goToView = "AnswerView"
					}
				}) {
					RoundedRectangle(cornerRadius: 25, style: .continuous)
						.strokeBorder(Color.replyButtonStroke,lineWidth: 1)
						.background(
							RoundedRectangle(cornerRadius: 25, style: .continuous)
								.foregroundColor(.replyButton.opacity(0.6)))
						.frame(width:120,height:50)
						.overlay(
							Text("回答")
								.font(.system(size: 30))
								.fontWeight(.semibold)
								.foregroundColor(.replyButtonText)
						)
				}
				.buttonStyle(PlainButtonStyle())
				Spacer()
			}
			.background(
				Image("old_paper_background")
					.resizable()
			)
			.onAppear{
				if lesson.quiz[lesson.currentLessonAt].status == 1 {
					lesson.currentLessonAt = lesson.currentLessonAt + 1
				}
				self.questionText = lesson.quiz[lesson.currentLessonAt].asking
			}
		}else{
			AnswerView()
		}
	}
}

struct QuestionView_Previews: PreviewProvider {
	static var previews: some View {
		QuestionView().environmentObject(Lesson())
	}
}

