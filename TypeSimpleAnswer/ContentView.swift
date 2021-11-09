//
//  ContentView.swift
//  TypeSimpleAnswer
//
//  Created by Leonore Yardimli on 2021/10/22.
//

import SwiftUI

struct ContentView: View {
	@State private var goToView = "ContentView"
	@EnvironmentObject var lessonToday: LessonToday
	
	var body: some View {
		if self.goToView == "ContentView" {
			VStack{
				Spacer()
				HStack{
					Spacer()
					Text("Hello Ege!")
						.font(.system(size: 60))
						.foregroundColor(lessonToday.myTheme.firstPageTextColor)
						.padding()
					Spacer()
				}
				
				Button(action: {
					withAnimation{
						self.goToView = "QuestionView"
					}
				}) {
					Circle()
						.strokeBorder(lessonToday.myTheme.arrowButtonStroke, lineWidth: 1)
						.background(Circle().foregroundColor(lessonToday.myTheme.arrowButtonBackground.opacity(lessonToday.myTheme.arrowButtonOpacity)))
						.frame(width:70,height:70)
						.overlay(
							Image("arrow_right_md")
								.resizable()
								.scaleEffect(0.6)
						)
				}
				.buttonStyle(PlainButtonStyle())
				Text(lessonToday.subject)
					.font(.system(size: 40))
					.foregroundColor(lessonToday.myTheme.firstPageTextColor)
					.padding()
				Spacer()
			}
			.background(
				Image(lessonToday.myTheme.firstPageBackground)
					.resizable(resizingMode: .tile)
			)
		}else{
			QuestionView().transition(.move(edge: .leading))
		}
		
		//.frame(maxWidth: .infinity, maxHeight: .infinity)
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environmentObject(LessonToday())
	}
}
