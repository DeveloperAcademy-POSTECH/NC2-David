//
//  QuizView.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/08/31.
//

enum QuizStateSample {
    case noraml, right, wrong
}

import Foundation
import UIKit
import SwiftUI
struct QuizView: View {
    @EnvironmentObject var imageClassification: ImageClassification
    @StateObject private var quizVM = QuizViewModel()
    
    let quizSetting: Int
    let timeSetting: Int
    
    init(q:Int, t:Int) {
        self.quizSetting = q
        self.timeSetting = t
    }
    var body: some View {
        if quizVM.quizNumber + 1 <= quizSetting {
            NavigationView{
                    VStack {
                        VStack(alignment: .center, spacing: 10) {
                            Image(uiImage:quizVM.quizModel.quizs[quizVM.quizNumber].image!)
                                    .resizable()
                                    .aspectRatio(1.3, contentMode: .fill )
                                    .padding(EdgeInsets(top:-20, leading: 30,bottom: 0, trailing: 30))
                            
                            Text("Timer : \(quizVM.timeRemaining)").font(.title)
                                .onReceive(quizVM.timer) { _ in
                                    if quizVM.timeRemaining > 0 {
                                        quizVM.timeRemaining -= 1
                                        if quizVM.timeRemaining == 0 {
                                            quizVM.resultState = .wrong
                                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                                                quizVM.nextQuiz(quizCount: quizSetting, inputTime: timeSetting)
                                            }
                                            quizVM.timeRemaining = timeSetting
                                        }
                                    }
                            }
                        }
                        VStack(alignment: .center, spacing: 10) {
                            HStack{
                                Button(action: {
                                }) {
                                    NavigationLink(destination: MainView()) {
                                        Text("퀴즈중단")
                                    }
                                }
                                .padding()
                                    .foregroundColor(.white)
                                    .background(Color.red)
                            }
                        HStack{
                                Text("정답")
                            TextField("텍스트", text:$quizVM.inputText)
                                .disableAutocorrection(true)
                                .onSubmit {
                                    if quizVM.inputText != quizVM.quizModel.quizs[quizVM.quizNumber].answer {
                                        quizVM.inputText = ""
                                        
                                    }
                                    quizVM.checkAnswer(quizCount: quizSetting, inputTime: timeSetting)
                            }
                            KeyBoardAppear(text:$quizVM.inputText)
                                .frame(width: 0, height: 0, alignment: .trailing)
                                .disableAutocorrection(true)
                            }
                            Spacer()
                        }
                    }.overlay(alignment:.top) {
                        switch quizVM.resultState {
                        case .right:
                            RightView().transition(.asymmetric(insertion: .move(edge: .top), removal: .opacity))
                                .animation(.easeInOut)
                                .padding(EdgeInsets(top: -50, leading: 0, bottom: 0, trailing: 0))
                        case .wrong:
                            WrongView(correct: quizVM.quizModel.quizs[quizVM.quizNumber].answer!).transition(.asymmetric(insertion: .move(edge: .top), removal: .opacity))
                                .animation(.easeInOut)
                                .padding(EdgeInsets(top: -50, leading: 0, bottom: 0, trailing: 0))
                        default:
                            NormalView();
                        }
                    }.padding(EdgeInsets(top: -50, leading: 0, bottom: 0, trailing: 0))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .onAppear {
            quizVM.timeRemaining = timeSetting
            quizVM.settingQuizs = Array(quizVM.quizModel.quizs[0...self.quizSetting])
            }

        } else {
            ResultView(rightNumber: quizVM.rightNumber)
        }
    }
}

//struct QuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizView(quizSetting: 5, timeSetting: 5, timeRemaining: 5)
//    }
//}



struct WrongView: View {
    let correct:String
    var body: some View {
        VStack{
            Text(correct).font(.headline)
                .foregroundColor(.red)
            Path { path in
                path.move(to: CGPoint(x: 0, y:0 ))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 150, y: 150))
                path.addLine(to: CGPoint(x: 0, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 0))

            }
            .stroke(.red, lineWidth: 10)
        }
        .frame(width: 300, height: 300)
    }
}



struct RightView: View {
    var body: some View {
        VStack {
            Circle()
                .stroke(Color.green, lineWidth: 10)
        }
        .contentShape(Circle())
        .frame(width: 300, height: 300, alignment: .center)
        
    }
}


struct NormalView: View {
    var body: some View {
        VStack {
            
        }
    }
}


