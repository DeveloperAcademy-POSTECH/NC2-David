//
//  QuizViewModel.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/08/31.
//

import Foundation
import SwiftUI
import UIKit

enum QuizState {
    case noraml, right, wrong
}

class QuizViewModel: ObservableObject {
    @Published var quizState = QuizState.noraml
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var timeRemaining: Int = 0
    @Published var inputText:String = ""
    @Published var resultState:QuizState = .noraml
    @Published var quizNumber:Int = 0
    @Published var quizModel:QuizModel = QuizModel()
    @Published var settingQuizs:[Quiz] = []
    @Published var rightNumber:Int = 0
    
    
    func checkAnswer(quizCount:Int, inputTime:Int) {
        if inputText == quizModel.quizs[quizNumber].answer {
            rightNumber += 1
            resultState = .right
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.nextQuiz(quizCount: quizCount, inputTime: inputTime)
            }
        }
    }
    
    func nextQuiz(quizCount:Int, inputTime:Int) {
        quizNumber += 1
        resultState = .noraml
        timeRemaining = inputTime
        inputText = ""
    }
}

