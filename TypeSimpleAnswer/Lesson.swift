//
//  Lesson.swift
//  Lesson
//
//  Created by Leonore Yardimli on 2021/10/22.
//

import Foundation
struct Lesson: Codable{
	var subject:String
	var quiz:[Quiz]
}

struct Quiz: Codable{
	var asking:String
	var answer:String
	var status:Int
}

/*
class Lesson: ObservableObject {
	//@Published var quiz:Quiz? //make the quiz optional
	@Published var subject:String? = /*"我們來打字！"*/"哪個比較大？\n哪個比較小？"
	@Published var quiz:[Quiz] = [
		/*Quiz(asking: "Simba是獅子對不對？", answer: "對", status: 0),
		Quiz(asking: "Tarzan是猴子對不對？", answer: "不對", status: 0),
		Quiz(asking: "Garfield是貓對不對？", answer: "對", status: 0),
		Quiz(asking: "Bugi是貓對不對？", answer: "對", status: 0),
		Quiz(asking: "Mus是貓對不對？", answer: "不對", status: 0),
		Quiz(asking: "Ege是人對不對？", answer: "對", status: 0),
		Quiz(asking: "媽媽是人對不對？", answer: "對", status: 0),
		Quiz(asking: "Hasbi是人對不對？", answer: "不對", status: 0)*/
		Quiz(order:1, asking: "Mus比Hasbi大對不對？", answer: "對", status: 0),
		Quiz(order:2, asking: "Mus比Bugi大對不對？", answer: "對", status: 0),
		Quiz(order:3, asking: "卡車比計程車大對不對？", answer: "對", status: 0),
		Quiz(order:4, asking: "公車比腳踏車大對不對？", answer: "對", status: 0),
		Quiz(order:5, asking: "恐龍比貓頭鷹大對不對？", answer: "對", status: 0),
		Quiz(order:6, asking: "獅子比猴子小對不對？", answer: "不對", status: 0),
		Quiz(order:7, asking: "大象比貓小對不對？", answer: "不對", status: 0),
		Quiz(order:8, asking: "杯子比電視小對不對？", answer: "不對", status: 0),
		Quiz(order:9, asking: "微波爐比湯匙小對不對？", answer: "不對", status: 0),
		Quiz(order:10, asking: "飛機比轎車小對不對？", answer: "不對", status: 0)
	]
	@Published var currentLessonAt = 0
	
	
}
*/
