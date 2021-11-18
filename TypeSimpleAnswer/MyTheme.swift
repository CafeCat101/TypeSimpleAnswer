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
	var contentButtonOpacity = 0.6
	var textInputBackgroundOpacity = 0.3
	
	var firstPageTextColor:Color = Color.black
	var contentTextColor:Color = .replyButtonText
	
	var firstPageBackground:String = "tileable_bg61"
	var contentPageBackground:String = "old_paper_background2"
	
	var correctAnswerAudio:String = "Bright Right Answer 4"
	var wrongAnswerAudio:String = "Cartoon Brass Fail"
	var finishedLessonAudio:String = "Cartoon Big Win"
	
	var wrongAnswerBackground:String = "wrong_answer_background"
	
	
	init(setThemeName:String? = "default"){
		if setThemeName == "blue"{
			firstPageBackground = "t2_welcome_bg"
			arrowButtonStroke = Color("t2_arrow_btn_stroke")
			arrowButtonBackground = Color("t2_arrow_btn_background")
			arrowButtonOpacity = 0.4
			
			contentPageBackground = "t2_sky_blue_background"
			contentTextColor = Color("t2_content_main_text")
			contentButtonBackground = Color("t2_content_btn_background")
			contentButtonStroke = Color("t2_content_btn_stroke")
		}
	}
	

	
	
}
