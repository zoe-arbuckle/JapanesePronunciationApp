//
//  Quiz.swift
//  JapanesePronunciationApp
//
//  Created by Zoe Arbuckle on 7/3/20.
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

class Quiz {
    
    //MARK: Properties
    var questions = [Question]()
    var qNumber = Int()
    
    //MARK: Initialization
    
    init?(lessonName: String){
        //sound file
        let sound1 = Bundle.main.path(forResource: "dokidoki", ofType: "mp3")
        var audio1 = AVAudioPlayer()
        let sound2 = Bundle.main.path(forResource: "daigaku", ofType: "mp3")
        var audio2 = AVAudioPlayer()
        
        do {
            audio1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound1!))
            audio2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound2!))
        } catch {
            print(error)
        }
        
        questions = [Question(question: "Identify the word you hear", answers: ["ときどき", "どきどき"], answer: 1, audioPlayer: audio1), Question(question: "Select the correct spelling", answers: ["だいがく", "たいがく"], answer: 0, audioPlayer: audio2)]
        questions.shuffle() //randomize
    }
    
    func pickQuestion() -> Question?{
        var q = Question()
        if questions.count > 0{
            q = questions[0]

            //prevent repetition
            questions.remove(at: 0)
            return q
        } else {
            //done with all questions
            NSLog("Done!")
            return nil
        }
    }
}
