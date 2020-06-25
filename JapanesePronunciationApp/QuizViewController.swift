//
//  QuizViewController.swift
//  JapanesePronunciationApp
//
//  Created by Zoe Arbuckle on 6/23/20 using Archetapp "Making a Quiz Game" video.
//  Copyright © 2020 Zoe Arbuckle. All rights reserved.
//

import UIKit
import AVFoundation

struct Question {
    var question : String!
    var answers : [String]!
    var answer : Int!
    var audioPlayer: AVAudioPlayer!
}

class QuizViewController: UIViewController {
    
    //should add a display of correct/incorrect which is hidden
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var NextStackView: UIStackView!
    @IBOutlet weak var SoundButton: UIButton!
    
    var questions = [Question]()
    var qNumber = Int()
    var ansNumber = Int()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sound file
        let sound = Bundle.main.path(forResource: "windsound", ofType: "mp3")
        var audio = AVAudioPlayer()
        
        do {
            audio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        } catch {
            print(error)
        }
        
        questions = [Question(question: "Identify the word you hear", answers: ["ときどき", "どきどき"], answer: 1, audioPlayer: audio), Question(question: "Select the correct spelling", answers: ["だいがく", "たいがく"], answer: 0, audioPlayer: audio)]
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
            
            audioPlayer = questions[qNumber].audioPlayer
            
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
    
    @IBAction func playSound(_ sender: Any) {
       audioPlayer.play()
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
        audioPlayer.stop()
        hide()
        pickQuestion()
        for b in Buttons{
            b.isEnabled = true
        }
    }
}
