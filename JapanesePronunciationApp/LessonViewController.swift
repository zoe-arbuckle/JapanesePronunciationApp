//
//  ViewController.swift
//  JapanesePronunciationApp
//
//  Created by Zoe Arbuckle on 6/3/20.
//  Copyright © 2020 Zoe Arbuckle. All rights reserved.
//

import UIKit

class LessonViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var informationLabel: UILabel!
    
    /*
     value passed by Lesson Table View Controller prepare(for: sender)
     */
    var lesson: Lesson?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let lesson = lesson {
            navigationItem.title = lesson.name
            nameLabel.text = lesson.name
            descriptionLabel.text = lesson.description
            photoImageView.image = lesson.photo
            informationLabel.text = lesson.lessonInfo
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.destination is QuizViewController {
            let quizVC = segue.destination as? QuizViewController
            quizVC?.quiz = lesson?.quiz
        }
    }

}

