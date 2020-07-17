//
//  Lesson.swift
//  JapanesePronunciationApp
//
//  Created by Zoe Arbuckle on 6/3/20.
//  Copyright © 2020 Zoe Arbuckle. All rights reserved.
//

import UIKit

class Lesson {
    
    //MARK: Properties
    var name: String
    var description: String
    var photo: UIImage?
    var lessonInfo: String
    var quiz: Quiz?
    
    //MARK: Initialization
    
    init?(name: String, description: String, photo: UIImage?, lessonInfo: String){
        if name.isEmpty || description.isEmpty {
            return nil
        }

        //init stored properties
        self.name = name
        self.description = description
        self.photo = photo
        self.lessonInfo = lessonInfo
        self.quiz = Quiz(lessonName: self.name)
    }
    
    init?(json: [String: Any]){
        self.name = json["lessonName"] as! String
        self.description = json["lessonDescription"] as! String
        
        let photoName = json["lessonImage"] as! String
        self.photo = UIImage(named: photoName)
        
        self.lessonInfo = json["lessonText"] as! String
        
        //remember this can be null, you are explicitly unwrapping
        if let dict = json["quiz"] as? [String: Any] {
            let questions = dict["questions"] as! [NSObject]
        
            self.quiz = Quiz(questionArray: questions)
        } else {
            self.quiz = Quiz(lessonName: self.name)
        }
    }
}
