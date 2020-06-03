//
//  JapanesePronunciationAppTests.swift
//  JapanesePronunciationAppTests
//
//  Created by Zoe Arbuckle on 6/3/20.
//  Copyright © 2020 Zoe Arbuckle. All rights reserved.
//

import XCTest
@testable import JapanesePronunciationApp

class JapanesePronunciationAppTests: XCTestCase {
    
    //MARK: Lesson Class Tests
    func testLessonInitializationSucceeds() {
        let lessonOne = Lesson.init(name: "Lesson One", description: "The first lesson", photo: nil)
        XCTAssertNotNil(lessonOne)
    }
    
    func testLessonInitializationFails() {
        let emptyNameLesson = Lesson.init(name: "", description: "The first lesson", photo: nil)
        XCTAssertNil(emptyNameLesson)
        
        let emptyDescriptionLesson = Lesson.init(name: "Lesson One", description: "", photo: nil)
        XCTAssertNil(emptyDescriptionLesson)
    }

}
