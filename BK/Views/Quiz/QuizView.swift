//
//  QuizView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 18/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject private var quizManager = QuizManager()
    
    @State private var guessedCorrectly = false
    @State private var showResult = false
    @State private var textColor = Color.white
    @State private var quiStarted = false
    
    var body: some View {
        ZStack {
            if (quiStarted == true){
                
            }
            
//            Color(red: 8.0 / 255.0, green: 43.0 / 255.0, blue: 62.0 / 255.0)
//                .edgesIgnoringSafeArea(.all)
            Color("bg").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(quizManager.currentQuestion.question)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("text"))
                    .font(.title)
                    .padding()
                
                Spacer()
                
                VStack {
                    ForEach(quizManager.currentQuestion.possibleAnswers) { answer in
                        AnswerButton(textColor: self.$textColor, answer: answer.text) {
                            self.guessedCorrectly = self.quizManager.checkAnswer(answer, to: self.quizManager.currentQuestion)
                            self.updateResult()
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            .padding()
        }
        .popover(isPresented: self.$showResult) {
            Result2(isPresented: self.$showResult, score: self.quizManager.correctAnswers)
                .onDisappear {
                    self.resetGame()
            }
        }
        .onAppear {
//            Sound.playGameStartSound()
        }
    }
    
    private func resetGame() {
        quizManager.questionsAsked = 0
        quizManager.correctAnswers = 0
        textColor = .white
        quizManager.getRandomQuestion()
    }
    
    private func updateResult() {
        if guessedCorrectly {
//            Sound.playRightAnswerSound()
        } else {
//            Sound.playWrongAnswerSound()
        }
        textColor = guessedCorrectly ? .white : .red
        if quizManager.questionsAsked == 4 {
            self.showResult.toggle()
        } else {
            loadNextRoundWithDelay(seconds: 1.5)
        }
    }
    
    private func loadNextRoundWithDelay(seconds: Double) {
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.textColor = .white
            self.quizManager.getRandomQuestion()
        }
    }
}
