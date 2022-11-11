//
//  Quiz.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/08/29.
//

import Foundation
import SwiftUI
import UIKit

// Model
struct Question {
    let questionImage:UIImage?
    let questionAnser:String
}


enum QuizState {
    case idle, right, wrong
}
@available(iOS 16.0, *)
class QuizViewModel: ObservableObject {
    
    @Published var quizState:QuizState = .idle
    @Published var score:Int = 0
    @Published var questionNumber = 0
    @Published var quiestionTime = 0
    @Published var timeRemaining = 0
    @Published var answer:String = ""
    
    func setTicktok() {
        if self.timeRemaining > 0 {
            self.timeRemaining -= 1
        } else {
            self.timeRemaining = quiestionTime
            nextQuiz()
        }
    }
    
    
    var quizs:[Question] = []
    
    // Random 원하는 갯수의 퀴즈생성 랜덤숫자가 들어있는 중복되지않는 배열을 만들고 그배열의 Int 값으로 퀴즈생성하기
    func makeQuizs(quizNumbers:Int, quizTimes:Int) {
        self.timeRemaining = quizTimes
        self.quiestionTime = quizTimes
        let allDataCount = allDatas.count
        var randomNumberArray:[Int] = []
        while randomNumberArray.count <= quizNumbers - 1 {
            let randomIndexNumber = Int.random(in: 0...allDataCount - 1)
            if (randomNumberArray.contains(randomIndexNumber)) == false {
                randomNumberArray.append(randomIndexNumber)
            }
        }
        for randomN in randomNumberArray {
            quizs.append(allDatas[randomN])
        }
    }
    func resetTimeRemaining() {
        timeRemaining = quiestionTime
    }
    
    func nextQuiz() {
        
        checkAnswer()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.resetTimeRemaining()
            self.quizState = .idle
            if self.questionNumber <= self.quizs.count {
                self.questionNumber += 1
            } else {
                self.questionNumber = 0
                self.score = 0
            }
        }
    }
    
    func getScore() {
        self.score += 1
    }
    
    func checkAnswer() {
        if self.answer == quizs[questionNumber].questionAnser {
            getScore()
            quizState = .right
        } else {
            quizState = .wrong
        }
    }
    // Quiz ALL Data
    let allDatas = [
    Question(questionImage: UIImage(named: "1"), questionAnser: "강다니엘"),
    Question(questionImage: UIImage(named: "2"), questionAnser: "강태오"),
    Question(questionImage: UIImage(named: "3"), questionAnser: "김연아"),
    Question(questionImage: UIImage(named: "4"), questionAnser: "류현진"),
    Question(questionImage: UIImage(named: "5"), questionAnser: "박은빈"),
    Question(questionImage: UIImage(named: "6"), questionAnser: "손석구"),
    Question(questionImage: UIImage(named: "7"), questionAnser: "손흥민"),
    Question(questionImage: UIImage(named: "8"), questionAnser: "싸이"),
    Question(questionImage: UIImage(named: "9"), questionAnser: "아이유"),
    Question(questionImage: UIImage(named: "10"), questionAnser: "유재석"),
    Question(questionImage: UIImage(named: "11"), questionAnser: "이찬원"),
    Question(questionImage: UIImage(named: "12"), questionAnser: "임영웅")
    ]
}

