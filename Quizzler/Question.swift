//
//  Question.swift
//  Quizzler
//
//  Created by Pavan Sabnis on 2/22/18.
//

import Foundation

class Question {
    let questionText: String
    let answer:  Bool
    
    //create the initializer/constructor for the Question
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}


