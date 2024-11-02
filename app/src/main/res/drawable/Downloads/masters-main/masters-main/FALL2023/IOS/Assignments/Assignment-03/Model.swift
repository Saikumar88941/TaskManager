//
//  UtilityConstants.swift
//  QuizApp
//
//  Created by Chandra on 10/06/23.
//

import Foundation

struct UtilityConstants {
    
    // category 1
    static let generalImages = ["pasta", "ireland", "olympics", "disney", "doraemon"]
    static let generalQuestions = [
        "Name any one of the ingredients of this dish?",
        "Mention any one of the colors in the flag of this country.",
        "How may years of gap is usually maintained among each Summer Olympic Games?",
        "Mention any one of the anime genre movies of this production house.",
        "Name any one of the characters of this show."
    ]
    static let generalDescription = [
        "Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes, then cooked by boiling or baking.",
        "The national flag of Ireland, frequently referred to in Ireland as 'the tricolour' and elsewhere as the Irish tricolour is a vertical tricolour of green, white and orange.",
        "The Summer Olympic Games, also known as the Games of the Olympiad, and often referred to as the Summer Olympics, is a major international multi-sport event normally held once every four years. The inaugural Games took place in 1896 in Athens, Greece.",
        "The Walt Disney Company, commonly known as Disney, is an American multinational mass media and entertainment conglomerate that is headquartered at the Walt Disney Studios complex in Burbank, California.",
        "Doraemon is a fictional character in the Japanese manga and anime series of the same name created by Fujiko F. Fujio. Doraemon is a male robotic earless cat that travels back in time from the 22nd century to aid a preteen boy named Nobita."]
    static let generalPossibilities = [
        ["pasta", "cheese", "sauce", "tomato", "water", "flour", "cream", "salt"],
        ["green", "orange", "white"],
        ["four", "4"],
        ["finding nemo", "up", "luca", "cocoa", "enchanto", "tangled"],
        ["nobita", "dorami", "doraemon", "goda"]
    ]
    
    // category 2
    static let swiftImages = ["uiElements", "datatypes", "closures", "control-flow", "strings"]
    static let swiftQuestions = [
        "Name any one of the UI Elements in Swift.",
        "Name any one of the datatypes in Swift programming language.",
        "Mention any one of the higher-order closures in Swift.",
        "Mention any one of the keywords that is used to control the flow of execution in Swift.",
        "Name any one of the methods one can invoke using a String instance in Swift."
    ]
    static let swiftDescription = [
        "UI elements are the visual elements that we can see in our applications. Some of these elements respond to user interactions such as buttons, text fields and others are informative such as images, labels.",
        "In computer science and computer programming, a data type is a collection or grouping of data values, usually specified by a set of possible values, a set of allowed operations on these values, and/or a representation of these values as machine types.",
        "Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.",
        "Swift includes several control flow keywords that help you manage the flow of your code and make decisions.",
        "A string is a series of characters, such as Swift , that forms a collection. Strings in Swift are Unicode correct and locale insensitive, and are designed to be efficient. The String type bridges with the Objective-C class NSString and offers interoperability with C functions that works with strings."
    ]
    static let swiftPossibilities = [
        ["switches", "steppers", "views", "sliders", "tab bars"],
        ["int", "float", "bool", "string", "double", "character"],
        ["map", "reduce", "filter"],
        ["break", "continue", "return", "fallthrough"],
        ["lowercased", "count", "append", "remove", "isEmpty"]
    ]
    
    // category 3
    static let gadgetsImages = ["boat", "iphone", "dell", "fitbit", "noise"]
    static let gadgetsQuestions = [
        "Mention any one of the products of this company.",
        "What is the new iPhone version?",
        "Name any one of the products of this company.",
        "Fitbit is known for what type of wearable devices?",
        "Noise is particularly famous for what category of consumer electronic products?"
    ]
    static let gadgetsDescription = [
        "BoAt designs and markets a variety of audio-focused consumer electronics, including wireless earbuds, wired headphones, wireless speakers, home audio equipment, smart watches, and an assortment of mobile phone accessories.",
        "iPhone is a line of smartphones produced by Apple Inc. that use Apple's own iOS mobile operating system. The first-generation iPhone was announced by then-Apple CEO Steve Jobs on January 9, 2007. Since then, Apple has annually released new iPhone models and iOS updates.",
        "Dell Inc. is an American based technology company. It develops, sells, repairs, and supports computers and related products and services. Dell is owned by its parent company, Dell Technologies.",
        "Fitbit is an American consumer electronics and fitness company. It produces wireless-enabled wearable technology, physical fitness monitors and activity trackers such as smartwatches, pedometers and monitors for heart rate, quality of sleep and stairs climbed as well as related software.",
        "The Noise Company is an American independent record label and music management company based in Austin, TX. The label was founded in 2007 by recording artist Ben Kweller. In 2009, Kweller stated in an Australian magazine that he recently parted ways with his long-time label-home."
    ]
    static let gadgetsPossibilities = [
        ["headsets", "soundbars", "fitness bands", "airdopes", "speakers"],
        ["15", "fifteen"],
        ["laptops", "desktops", "servers", "monitors"],
        ["fitness", "health-related"],
        ["audio", "wearable"]
    ]
    
    static let categories = [
        "general": [
            generalImages,
            generalDescription,
            generalQuestions,
            generalPossibilities
        ],
        "swift": [
            swiftImages,
            swiftDescription,
            swiftQuestions,
            swiftPossibilities
        ],
        "gadgets": [
            gadgetsImages,
            gadgetsDescription,
            gadgetsQuestions,
            gadgetsPossibilities
        ]
    ]
    
    static let defaultMessage = """
                                Get habituated!!!
                                - Select any category of your choice.
                                - Swipe left or right on the image for more quiz items.
                                - Double tap on the image to learn more about it.
                                - Triple tap on the image to have fun!
                                """
    
    static let correctMessage = "Yayyy! 🥳 Bullseye 🎯."
    static let incorrectMessage = "Oops! You got it wrong or this answer was not in the list of possible answers."
    static let defaultDescMessage = "Oops! We haven't found anything related to this item."
    static let defaultQuesMessage = "Not a fun quiz 🙁."
}

struct Picture {
    let name: String
    let description: String
    let question: String
    
    init(name: String, description: String, question: String) {
        self.name = name
        self.description = description
        self.question = question
    }
}

struct Category {
    var possibilities: [[String]]
    var pictures: [Picture]
    
    init(){
        self.possibilities = []
        self.pictures = []
    }
    
    init(with possibilities: [[String]], pictures: [Picture]) {
        self.possibilities = possibilities
        self.pictures = pictures
    }
}

enum Gesture: CaseIterable{
    case swipeLeft, swipeRight, doubleTap, tripleTap
}
