//
//  ResultView.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/09/02.
//

import Foundation
import SwiftUI


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


struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(rightNumber: 3)
    }
}
