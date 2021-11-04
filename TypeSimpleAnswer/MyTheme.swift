//
//  MyTheme.swift
//  MyTheme
//
//  Created by Leonore Yardimli on 2021/11/3.
//

import Foundation
import SwiftUI

struct MyTheme{
	var themeName = "default"
	
	var arrowButtonStroke:Color = Color.yellow
	var arrowButtonBackground:Color = .arrowButton
	var arrowButtonOpacity = 0.4
	var contentButtonStroke:Color = .replyButtonStroke
	var contentButtonBackground:Color = .replyButton
	
	var firstPageTextColor:Color = Color.black
	var contentTextColor:Color = .replyButtonText
	
	var firstPageBackground:String = "tileable_bg61"
	var contentPageBackground:String = "old_paper_background2"
	
	var correctAnswerAudio:String = "Bright Right Answer 4"
	var wrongAnswerAudio:String = "Cartoon Brass Fail"
	var finishedLessonAudio:String = "Cartoon Big Win"
	
	
	init(setThemeName:String? = "default"){
		if setThemeName == "ocean"{
			arrowButtonStroke = Color.blue
		}
	}
	

	
	
}
