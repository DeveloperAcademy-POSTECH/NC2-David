//
//  ContentView.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/08/27.
//

import SwiftUI
import Foundation
@available(iOS 16.0, *)
struct MainView: View {

    @StateObject private var mainVM = MainViewModel()
    var body: some View {
        NavigationView{
            VStack {
                VStack(alignment: .center, spacing: 15) {
                    Text("인물퀴즈").font(.title)
                    Image("example").resizable()
                        .frame(width: 200, height: 200, alignment: .center)

                    Text("Quiz Role").font(.title)
                    Text("화면에 나오는 인물을 타이핑으로 맞춰주세요").font(.body)
                    Text("퀴즈수와 입력시간을 설정해서").font(.body)
                    Text("퀴즈에 도전해보세요!").font(.body)
                }
                VStack(alignment: .center, spacing: 25) {
                        Slider(
                            value: $mainVM.quizNumber,
                            in: 0...10,
                            step: 1 ) {
                                Text("퀴즈수")
                            } onEditingChanged: { editing in
                                mainVM.isQUizNumberEditing = editing
                            }
                        Text("퀴즈수 : \(Int(mainVM.quizNumber))").font(.title)
                            .foregroundColor(mainVM.isQUizNumberEditing ? .red : .blue)
                        Slider(
                            value: $mainVM.inputTime,
                            in: 0...10,
                            step: 1 ) {
                                Text("입력시간")
                            } onEditingChanged: { editing in
                                mainVM.isInputTimeEditing = editing
                            }
                        Text("입력시간 : \(Int(mainVM.inputTime))").font(.title)
                            .foregroundColor(mainVM.isInputTimeEditing ? .red : .blue)
                    Button(action: {
                    }) {
                        NavigationLink(destination: NewQuizView(q: Int(mainVM.quizNumber), t: Int(mainVM.inputTime))) {
                            Text("퀴즈시작하기")
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    }
                Spacer().frame(height:80)
                }

        }.navigationTitle("")
            .navigationBarHidden(true)
        }
    }

@available(iOS 16.0, *)
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


