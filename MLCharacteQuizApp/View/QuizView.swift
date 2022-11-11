//
//  NewQuizView.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/11/06.
//

import Foundation
import SwiftUI
import UIKit



@available(iOS 16.0, *)
struct NewQuizView: View {
    
    //TODO: ImageClasification통한 CheckAnswer
    //MARK: update 와 View Sync 문제 및 ClassifiLabel 가져올떄 항상 강태오, 싸이만 나오는 문제및  update 함수와 ViewImage가 매치가 안돼는버그
    @ObservedObject var imageClassification = ImageClassification()
    
    @ObservedObject var quizViewModel = QuizViewModel()
    
    // Quiz Timer View에서 생성
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let quizSetNumbers: Int
    let quizSetTimes: Int
    
    init(q:Int, t: Int) {
        self.quizSetNumbers = q
        self.quizSetTimes = t
        quizViewModel.makeQuizs(quizNumbers: q, quizTimes: t)
    }
    
    @State var inputText: String = ""
    
    var body: some View {
        NavigationView {
            if quizViewModel.questionNumber < quizSetNumbers {
                VStack {
                    HStack{
                        Spacer()
                        Button(action: {
                        }) {
                            NavigationLink(destination: MainView())  {
                                Text("퀴즈종료")
                                    .foregroundColor(.red)
                                    .padding()
                            }
                        }
                    }
                    // TODO: Timer 설정부분시작
                    Text(String(format: "제한시간: %D 초", quizViewModel.timeRemaining as CVarArg))
                        .font(.largeTitle)
                        .onReceive(timer) { _ in
                            self.quizViewModel.setTicktok()
                        }
                    Image(uiImage: quizViewModel.quizs[quizViewModel.questionNumber].questionImage!)
                        .resizable()
                        .aspectRatio(0.9,contentMode: .fit)
                    TextField("풀네임  ex) 홍길동 ", text:$quizViewModel.answer)
                        .disableAutocorrection(true)
                        .font(.title)
                        .onSubmit({
                            quizViewModel.nextQuiz()
                            print($quizViewModel.answer)
                            quizViewModel.answer = ""

                        })
                        .padding(EdgeInsets(top:30,leading: 30, bottom: 0, trailing: 0))
                    Spacer()
                }
                .overlay(alignment:.center) {
                    if quizViewModel.quizState == .right {
                        RightView()
                        
                    } else if quizViewModel.quizState == .wrong {
                        WrongView()
                    } else {
                        IdleView()
                    }
                }
            } else {
                ResultView(rightNumber: quizViewModel.score)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}


@available(iOS 16.0, *)
struct NewQuizView_Previews: PreviewProvider {
    
    @ObservedObject var quizViewModel = QuizViewModel()
    
    static var previews: some View {
        NewQuizView(q: 5, t: 5)
    }
}
struct WrongView: View {

    var body: some View {
        Image("wrong")
    }
}



struct RightView: View {
    var body: some View {
        Image("right")
    }
}

struct IdleView: View {
    var body: some View {
        VStack{
        }
    }
}
