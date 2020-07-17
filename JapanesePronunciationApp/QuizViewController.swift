//
//  QuizViewController.swift
//  JapanesePronunciationApp
//
//  Created by Zoe Arbuckle on 6/23/20 using Archetapp "Making a Quiz Game" video.
//  Copyright © 2020 Zoe Arbuckle. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController {
    
    //should add a display of correct/incorrect which is hidden
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var NextStackView: UIStackView!
    @IBOutlet weak var SoundButton: UIButton!
    
    var quiz: Quiz!
    var ansNumber = Int()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NextButton.setTitle("Next Question", for: .normal)
        
        hide()
        pickNextQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickNextQuestion(){
        let question = quiz.pickQuestion()
        if (question == nil){
            //unwind
            NSLog("unwinding")
        } else {
            QLabel.text = question!.question
            ansNumber = question!.answer
            
            //fill in the buttons
            for i in 0..<Buttons.count{
                Buttons[i].setTitle(question!.answers[i], for: .normal)
            }
            
            audioPlayer = question!.audioPlayer
        }
    }
    
    // MARK: Private Functions
    
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
    
    // MARK: Button Actions
    
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
        pickNextQuestion()
        for b in Buttons{
            b.isEnabled = true
        }
    }
}
