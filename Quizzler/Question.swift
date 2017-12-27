//
//  Question.swift
//  Quizzler
//
//  Created by Jose Pino on 27/12/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

// Clase estructura para las preguntas
class Question {
    
    let questionText : String
    let answer : Bool
    
    init (text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}


