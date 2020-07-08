//
//  LessonsTableViewController.swift
//  JapanesePronunciationApp
//
//  Created by Zoe Arbuckle on 6/3/20.
//  Copyright © 2020 Zoe Arbuckle. All rights reserved.
//

import UIKit

class LessonTableViewController: UITableViewController {
    
    //MARK: Properties
    var lessons = [Lesson]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //load the sample
        loadLessons()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LessonTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LessonTableViewCell else {
            fatalError("The dequeued cell is not an instance of LessonTableViewCell")
        }
        
        //fetch the appropriate lesson
        let lesson = lessons[indexPath.row]
        
        // Configure the cell...
        cell.nameLabel.text = lesson.name
        cell.descriptionLabel.text = lesson.description
        cell.photoImageView.image = lesson.photo

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let lessonDetailViewController = segue.destination as? LessonViewController else {
            fatalError("Unexpected destination: \(String(describing: sender))")
        }
        
        guard let selectedLessonCell = sender as? LessonTableViewCell else {
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedLessonCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedLesson = lessons[indexPath.row]
        lessonDetailViewController.lesson = selectedLesson
    }
    
    //MARK: Private Methods
    
    private func loadLessons() {
        let photo1 = UIImage(named: "emptyImage")

        guard let introduction = Lesson(name: "Introduction to Japanese Accents 日本語のアクセントの練習", description: "Basics of Japanese Rythmic Unit: Mora", photo: photo1, lessonInfo: "First, you will learn about basic rhythic unit, called \"mora.\"\nMora is a technical term that linguists use to define a phonological unit of a language. It is different from syllable. In Japanese, you can think of each kana corresponding a mora. For example, ぼく(\"boku\") consists of two moras, and わたし (\"watashi\") consists of three moras. A double consonant written with small つ (\"tsu\") and nasal sound ん (\"n\") constitute a mora. A glide such as きゃ (\"kya\") and びょ (\"byo\") constitute a mora although it is written with two kana. A long vowel like こう (pronounced as long こ) is considered two moras. Thus, こうこう (high school) has four moras while ここ (here) has two.\nReview the following words and tnumber of mora for each word to understand the principle.\n") else {
            fatalError("Unable to instantiate lesson")
        }
        
        let file = Bundle.main.url(forResource: "data", withExtension: "json")
        
        guard let jsonData = file else{
                NSLog("Could not read local json data")
                return
        }
        guard let data = try? Data(contentsOf: jsonData) else {
                NSLog("Could not read data")
                return}
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}
        
        if let dictionary = json as? [String: Any]{
            let lessonOne = Lesson(json: dictionary)!
            lessons += [introduction, lessonOne]
        } else{
            lessons += [introduction]
        }
        
        
        
    }

}
