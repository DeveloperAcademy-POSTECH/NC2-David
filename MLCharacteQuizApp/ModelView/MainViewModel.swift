//
//  ContentViewModel.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/08/27.
//

import Foundation


class MainViewModel: ObservableObject {
    @Published var quizNumber = 5.0
    @Published var inputTime = 5.0
    @Published var isQUizNumberEditing = false
    @Published var isInputTimeEditing = false
    
}
