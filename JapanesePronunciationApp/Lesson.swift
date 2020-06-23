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
    }
}
