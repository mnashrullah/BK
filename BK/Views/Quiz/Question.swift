//
//  Question.swift
//  mila
//
//  Created by Muhammad Nashrullah on 18/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import Foundation

struct Question {
    var id: String = UUID().uuidString
    var question: String
    var answer: Answer
    var possibleAnswers: [Answer]
}

extension Question: Equatable {}

struct Answer: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var text: String
}
