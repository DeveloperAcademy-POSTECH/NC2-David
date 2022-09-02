////
////  ContentView.swift
////  MLCharacteQuizApp
////
////  Created by David_ADA on 2022/08/27.
////
//
//import SwiftUI
//import Foundation
//struct MainView: View {
//    @State var timeRemaining = 10
//    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    @State private var isShowPhotoLibrary = false
//    @State private var presentImage: UIImage?
//    @State private var classificationName = "Default"
//    @State private var quizNumber = 5.0
//    @State private var inputTime = 5.0
//    @State private var isQUizNumberEditing = false
//    @State private var isInputTimeEditing = false
//    @State private var isPresented = false
//    @State private var sourceType = UIImagePickerController.SourceType.photoLibrary
//    @State private var image: UIImage?
//
//    // image classifier
//    @ObservedObject var classification = ImageClassification()
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            // display the image
//            if let image = self.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .edgesIgnoringSafeArea(.all)
//            }
//
//            else {
//                Image(uiImage: UIImage())
//                    .resizable()
//                    .scaledToFill()
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .edgesIgnoringSafeArea(.all)
//            }
//
//            VStack {
//                Text("\(timeRemaining)")
//                            .onReceive(timer2) { _ in
//                                if timeRemaining > 0 {
//                                    timeRemaining -= 1
//                                    if timeRemaining == 0 {
//                                        timeRemaining = 10
//                                    }
//                                }
//                            }
//                Button("퀴즈시작하기") {
//
//                }
//                Slider(
//                            value: $quizNumber,
//                            in: 0...10,
//                            onEditingChanged: { editing in
//                                isQUizNumberEditing = editing
//                            }
//                        )
//                        Text("\(quizNumber)")
//                            .foregroundColor(isQUizNumberEditing ? .yellow : .blue)
//                Slider(
//                            value: $inputTime,
//                            in: 0...10,
//                            onEditingChanged: { editing in
//                                isInputTimeEditing = editing
//                            }
//                        )
//                        Text("\(inputTime)")
//                            .foregroundColor(isInputTimeEditing ? .green : .blue)
//                // display the classification result
//                Text(classification.classificationLabel)
//                    .padding(20)
//                    .foregroundColor(.black)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .foregroundColor(.secondary)
//                        )
//
//                // select camera or photo library
//                Menu {
//                    Button(action: {
//                        self.isPresented.toggle()
//                        self.sourceType = .camera
//                    }, label: {
//                        Text("Take Photo")
//                    })
//
//                    Button(action: {
//                        self.isPresented.toggle()
//                        self.sourceType = .photoLibrary
//                    }, label: {
//                        Text("Choose Photo")
//                    })
//                } label: {
//                    Image(systemName: "camera")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .padding(5)
//                }
//                .sheet(isPresented: $isPresented, onDismiss: {
//                    // Classify the image
//                    if let image = self.image {
//                        classification.updateClassifications(for: image)
//                    }
//                }, content: {
//                    ImagePicker(sourceType: .photoLibrary, image:$image)
//                })
//            }
//        }
//    }
//}
//
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
//
////
////    @ObservedObject var classification = ImageClassification()
////
////    @State var currentDate = Date()
////        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
////    @State var timeRemaining = 10
////    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
////    @State private var isShowPhotoLibrary = false
////    @State private var presentImage: UIImage?
////    @State private var classificationName = "Default"
//    @State private var quizNumber = 5.0
//    @State private var inputTime = 5.0
//    @State private var isQUizNumberEditing = false
//    @State private var isInputTimeEditing = false
////
////
////    var body: some View {
////        VStack {
////            Text("\(timeRemaining)")
////                        .onReceive(timer2) { _ in
////                            if timeRemaining > 0 {
////                                timeRemaining -= 1
////                                if timeRemaining == 0 {
////                                    timeRemaining = 10
////                                }
////                            }
////                        }
////            Button("퀴즈시작하기") {
////
////            }
//            Slider(
//                        value: $quizNumber,
//                        in: 0...10,
//                        onEditingChanged: { editing in
//                            isQUizNumberEditing = editing
//                        }
//                    )
//                    Text("\(quizNumber)")
//                        .foregroundColor(isQUizNumberEditing ? .yellow : .blue)
//            Slider(
//                        value: $inputTime,
//                        in: 0...10,
//                        onEditingChanged: { editing in
//                            isInputTimeEditing = editing
//                        }
//                    )
//                    Text("\(inputTime)")
//                        .foregroundColor(isInputTimeEditing ? .green : .blue)
////            if let image = self.presentImage {
////                Image(uiImage: image)
////                    .resizable()
////                    .scaledToFill()
////                    .frame(minWidth: 0, maxWidth: .infinity)
////                    .edgesIgnoringSafeArea(.all)
////            }
////            else {
////                Image(uiImage: UIImage())
////                    .resizable()
////                    .scaledToFill()
////                    .frame(minWidth: 0, maxWidth: .infinity)
////                    .edgesIgnoringSafeArea(.all)
////            }
////            HStack {
////                Text(classificationName).bold()
////                Button {
////                    classification.updateClassifications(for: self.presentImage)
////                    print("이미지식별")
////                } label: {
////                    Text("이미지식별")
////                }
////
////            }
////
////            Button(action: {
////                self.isShowPhotoLibrary = true
////            }) {
////                HStack {
////                    Image(systemName: "photo")
////                        .font(.system(size: 20))
////
////                    Text("Photo library")
////                        .font(.headline)
////                }
////                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
////                .background(Color.blue)
////                .foregroundColor(.white)
////                .cornerRadius(20)
////                .padding(.horizontal)
////            }
////
////        }.sheet(isPresented:$isShowPhotoLibrary) {
////            ImagePicker(sourceType: .photoLibrary, selectedImage: $presentImage)
////        }
////    }
//
//

