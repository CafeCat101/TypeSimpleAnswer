//
//  TypeSimpleAnswerApp.swift
//  TypeSimpleAnswer
//
//  Created by Leonore Yardimli on 2021/10/22.
//

import SwiftUI

@main
struct TypeSimpleAnswerApp: App {
	@StateObject var lessonToday = LessonToday()
	var body: some Scene {
		WindowGroup {
			ContentView().environmentObject(lessonToday)
		}
	}
}
