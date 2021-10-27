//
//  ViewModel.swift
//  Destini
//
//  Created by Алишер Алсейт on 27.10.2021.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var questions = [Question]()
    
    // Current question
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonURL!)
            
            let questions = try JSONDecoder().decode([Question].self, from: jsonData)
            
            self.questions = questions
            
            
            // Set the current question index
            currentQuestionIndex = 0
            
            // If there are questions, set the current question to the first one
            if questions.count  > 0 {
                currentQuestion = questions[currentQuestionIndex]
                
               
            }
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        
    }
    
    func beginTest() {
        
      
        
        // Set the current question index
        currentQuestionIndex = 0
        
        // If there are questions, set the current question to the first one
        if questions.count  > 0 {
            currentQuestion = questions[currentQuestionIndex]
            
           
        }
    }
    
    func nextQuestion() {
        
        // Advance the question index
        currentQuestionIndex += 1
        
        // Check that it's within the range of questions
        if currentQuestionIndex < questions.count {
            
            // Set the current question
            currentQuestion = questions[currentQuestionIndex]
            
        }
        else {
            // If not, then reset the properties
            currentQuestionIndex = 0
            currentQuestion = nil
        }
        
    }
    
}
