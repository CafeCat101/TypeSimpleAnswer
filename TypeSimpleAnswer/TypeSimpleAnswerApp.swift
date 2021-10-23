//
//  TypeSimpleAnswerApp.swift
//  TypeSimpleAnswer
//
//  Created by Leonore Yardimli on 2021/10/22.
//

import SwiftUI

@main
struct TypeSimpleAnswerApp: App {
	@StateObject var lesson = Lesson()
	var body: some Scene {
		WindowGroup {
			ContentView().environmentObject(lesson)
		}
	}
}
