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
					if self.answer == lessonToday.quiz[lessonToday.currentLessonAt].answer {
						lessonToday.quiz[lessonToday.currentLessonAt].status = 1
					}else{
						lessonToday.quiz[lessonToday.currentLessonAt].status = -1
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
				Image("old_paper_background2")
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

