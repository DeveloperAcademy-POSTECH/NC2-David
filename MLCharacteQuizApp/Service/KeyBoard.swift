//
//  KeyBoard.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/09/01.
//

import Foundation
import UIKit
import SwiftUI

// KeyBoard 자동입력창생성
struct KeyBoardAppear: UIViewRepresentable {
    
    @Binding var text: String
    
    
    class Coordinator:  NSObject, UITextFieldDelegate {
        @Binding var text: String
        var becomeFirstResponder = false
        init(text: Binding<String>) {
            self._text = text
        }
        
        
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            text = textField.text ?? ""
            return true
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    func makeUIView(context: Context) -> some UIView {
        let textField = UITextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if !context.coordinator.becomeFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.becomeFirstResponder = true
        }
    }
}
