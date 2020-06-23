//
//  QuizViewController.swift
//  JapanesePronunciationApp
//
//  Created by Zoe Arbuckle on 6/23/20.
//  Copyright © 2020 Zoe Arbuckle. All rights reserved.
//

import UIKit

struct Question {
    var question : String!
    var answers : [String]!
    var answer : Int!
}

class QuizViewController: UIViewController {
    
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    
    var questions = [Question]()
    var qNumber = Int()
    var ansNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = [Question(question: "Which is correct?", answers: ["Not this", "This"], answer: 1), Question(question: "Which is correct?", answers: ["This", "Not this"], answer: 0)]
        
        pickQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickQuestion(){
        if questions.count > 0{
            qNumber =  questions.indices.randomElement()! //will cause crash if questions is empty
            QLabel.text = questions[qNumber].question
            ansNumber = questions[qNumber].answer
            
            //fill in the buttons
            for i in 0..<Buttons.count{
                Buttons[i].setTitle(questions[qNumber].answers[i], for: UIControl.State.normal)
            }
            
            //prevent repetition
            questions.remove(at: qNumber)
        } else {
            //done with all questions
            NSLog("Done!")
        }
        
        
    }
    
    @IBAction func buttonOne(_ sender: Any) {
        if ansNumber == 0{
            pickQuestion()
        } else {
            NSLog("wrong answer")
        }
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        if ansNumber == 1{
            pickQuestion()
        } else {
            NSLog("wrong answer")
        }
    }
    
}
