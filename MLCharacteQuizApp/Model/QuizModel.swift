//
//  Quiz.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/08/29.
//

import Foundation
import UIKit
import SwiftUI


class Quiz {
    
    let image:UIImage?
    let answer:String?
    
    init(image:UIImage, answer:String) {
        self.image = image
        self.answer = answer
    }
    
}

class QuizModel {
    // 전체 데이터를 가지고있기
    var quizs:[Quiz] = {
        let someQuizs = [
            Quiz(image: UIImage(named: "강다니엘")!, answer: "강다니엘"),
            Quiz(image: UIImage(named: "강태오")!, answer: "강태오"),
            Quiz(image: UIImage(named: "김연아")!, answer: "김연아"),
            Quiz(image: UIImage(named: "류현진")!, answer: "류현진"),
            Quiz(image: UIImage(named: "박은빈")!, answer: "박은빈"),
            Quiz(image: UIImage(named: "손석구")!, answer: "손석구"),
            Quiz(image: UIImage(named: "손흥민")!, answer: "손흥민"),
            Quiz(image: UIImage(named: "싸이")!, answer: "싸이"),
            Quiz(image: UIImage(named: "아이유")!, answer: "아이유"),
            Quiz(image: UIImage(named: "유재석")!, answer: "유재석"),
            Quiz(image: UIImage(named: "이찬원")!, answer: "이찬원"),
            Quiz(image: UIImage(named: "임영웅")!, answer: "임영웅")
    ]
        return someQuizs.shuffled()
    }()
    

}

