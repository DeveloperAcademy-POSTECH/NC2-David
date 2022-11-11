//
//  ResultView.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/09/02.
//

import Foundation
import SwiftUI


@available(iOS 16.0, *)
struct ResultView: View {
    let rightNumber:Int
    
    var body: some View {
        NavigationView{
            VStack{
                Text("맞은갯수: \(rightNumber)").font(.title)
                Button(action: {
                }) {
                    NavigationLink(destination: MainView()) {
                        Text("다시하기")
                    }
                }
                .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
            }
        }
    }
}


@available(iOS 16.0, *)
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(rightNumber: 3)
    }
}
