//
//  LessonToday.swift
//  LessonToday
//
//  Created by Leonore Yardimli on 2021/11/2.
//

import Foundation
import SwiftUI

class LessonToday: ObservableObject {
	@Published var subject:String = "我們來打字"
	@Published var quiz: [Quiz] = [
		Quiz(asking: "這是對！", picture:"", answer: "對", status: 0),
		Quiz(asking: "這是不對！", picture:"", answer: "不對", status: 0)
	]
	@Published var currentLessonAt = 0
	@Published var myTheme:MyTheme = MyTheme()
	
	init() {
		loadLocalFile(forName: "lesson-type_simple_answer")
	}
	
	private func loadLocalFile(forName name: String) {
		do {
			if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
				 let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
				let decodedData = try JSONDecoder().decode(Lesson.self, from: jsonData)
				subject = decodedData.subject
				quiz = decodedData.quiz
				quiz.shuffle()
				myTheme = MyTheme(setThemeName: decodedData.theme)
			}
		} catch {
			print(error)
		}
	}
	
	/*
	func getBorderStrokeColor() -> Color{
		return Color.replyButtonStroke
	}*/
	
}
