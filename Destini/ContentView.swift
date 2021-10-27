//
//  ContentView.swift
//  Destini
//
//  Created by Алишер Алсейт on 27.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var selectedAnswerIndex:Int?
    @State var submitted = false
    
    @State var numCorrect = 0
    @State var showResults = false
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        if model.currentQuestion != nil &&
            showResults == false {
            
            ZStack {
                Image("background")
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    
                    //                        Text("Question \(model.currentQuestionIndex + 1) of \(model.questions.count)")
                    //                            .padding(.leading, 20)
                    
                    Text(model.currentQuestion!.content)
                        .padding(.horizontal, 60)
                        .foregroundColor(Color.white)
                        
                    
                    
                    VStack {
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                // Track the selected index
                                selectedAnswerIndex = index
                                
                                
                                // Check if it's the last question
                                if model.currentQuestionIndex + 1 == model.questions.count {
                                    
                                    // Show the results
                                    showResults = true
                                }
                                
                                else {
                                    
                                    model.nextQuestion()
                                    
                                    
                                    submitted = false
                                    selectedAnswerIndex = nil
                                }
                                
                                
                            } label: {
                                
                                Text(model.currentQuestion!.answers[index])
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(
                                        Rectangle()
                                            .frame(width: getScreenBounds().width - 20)
                                            .foregroundColor(index == 0 ? .red : .blue)
                                    )
                                
                                
                                
                                
                                
                                
                            }
                            .padding(.vertical)
                            //                                    .disabled(submitted)
                            
                        }
                        
                    }
                    .accentColor(.black)
                    .padding()
                    
                    
                }
                .padding()
                
                
            }
            .padding()
            
            
            
        }
        else {
            ResultView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}

extension View {
    func getScreenBounds()->CGRect{
        
        return UIScreen.main.bounds
    }
}
