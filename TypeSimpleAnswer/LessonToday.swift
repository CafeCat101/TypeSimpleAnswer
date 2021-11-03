//
//  LessonToday.swift
//  LessonToday
//
//  Created by Leonore Yardimli on 2021/11/2.
//

import Foundation

class LessonToday: ObservableObject {
	@Published var subject:String = "我們來打字"
	@Published var quiz: [Quiz] = [
		Quiz(asking: "Simba是獅子對不對？", answer: "對", status: 0),
		Quiz(asking: "Garfield是貓對不對？", answer: "對", status: 0),
		Quiz(asking: "Tarzan是猴子對不對？", answer: "不對", status: 0)
	]
	@Published var currentLessonAt = 0
	
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
			}
		} catch {
			print(error)
		}
	}
	
}