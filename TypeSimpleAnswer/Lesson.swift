//
//  Lesson.swift
//  Lesson
//
//  Created by Leonore Yardimli on 2021/10/22.
//

import Foundation

class Lesson: ObservableObject {
	//@Published var quiz:Quiz? //make the quiz optional
	@Published var quiz:[Quiz] = [
		Quiz(asking: "Hasbi是貓對不對？", answer: "對", status: 0),
		Quiz(asking: "Bugi是貓對不對？", answer: "對", status: 0),
		Quiz(asking: "Mus是貓對不對？", answer: "不對", status: 0),
		Quiz(asking: "爸爸是人對不對？", answer: "對", status: 0),
		Quiz(asking: "媽媽是人對不對？", answer: "對", status: 0),
		Quiz(asking: "Hasbi是人對不對？", answer: "不對", status: 0)
	]
	@Published var currentLessonAt = 0
	
	
}
