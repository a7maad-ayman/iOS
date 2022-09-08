//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ahmad Ayman Mansour on 05/08/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let answer : [String]
    let text : String
    let correctAnswer : String
    
    init (q:String , a:[String] , c : String){
        text = q
        answer = a
        correctAnswer = c
    }
    
}
