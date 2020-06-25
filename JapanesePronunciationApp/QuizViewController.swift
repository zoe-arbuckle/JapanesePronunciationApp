//
//  QuizViewController.swift
//  JapanesePronunciationApp
//
//  Created by Zoe Arbuckle on 6/23/20 using Archetapp "Making a Quiz Game" video.
//  Copyright © 2020 Zoe Arbuckle. All rights reserved.
//

import UIKit

struct Question {
    var question : String!
    var answers : [String]!
    var answer : Int!
}

class QuizViewController: UIViewController {
    
    //should add a display of correct/incorrect which is hidden
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var NextStackView: UIStackView!
    
    var questions = [Question]()
    var qNumber = Int()
    var ansNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = [Question(question: "Which is correct?", answers: ["Not this", "This"], answer: 1), Question(question: "Which is correct?", answers: ["This", "Not this"], answer: 0)]
        questions.shuffle() //randomize
        
        NextButton.setTitle("Next Question", for: .normal)
        
        hide()
        pickQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickQuestion(){
        if questions.count > 0{
            qNumber = 0 //always start at index 0
            QLabel.text = questions[qNumber].question
            ansNumber = questions[qNumber].answer
            
            //fill in the buttons
            for i in 0..<Buttons.count{
                Buttons[i].setTitle(questions[qNumber].answers[i], for: .normal)
            }
            
            //prevent repetition
            questions.remove(at: qNumber)
        } else {
            //done with all questions
            NSLog("Done!")
        }
        
        
    }
    
    private func hide(){
        NextStackView.isHidden = true
        ResultLabel.isHidden = true
        NextButton.isHidden = true
    }
    
    private func show(){
        NextStackView.isHidden = false
        ResultLabel.isHidden = false
        NextButton.isHidden = false
    }
    
    @IBAction func buttonOne(_ sender: Any) {
        for b in Buttons{
            b.isEnabled = false
        }
        show()
        if ansNumber == 0{
            ResultLabel.text = "Correct!"
        } else {
            ResultLabel.text = "Try Again!"
        }
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        for b in Buttons{
            b.isEnabled = false
        }
        show()
        if ansNumber == 1{
            ResultLabel.text = "Correct!"
        } else {
            ResultLabel.text = "Try Again!"
        }
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        hide()
        pickQuestion()
        for b in Buttons{
            b.isEnabled = true
        }
    }
}
