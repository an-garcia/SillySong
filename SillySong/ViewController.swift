//
//  ViewController.swift
//  SillySong
//
//  Created by xengar on 2017-10-01.
//  Copyright © 2017 xengar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var liricsField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        liricsField.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        
        let inputName: String = nameField.text!
        let shortName = shortNameFromName(name: inputName)
        //print(shortName)
        // join an array of strings into a single template string:
        let bananaFanaTemplate = [
            "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
            "Banana Fana Fo F<SHORT_NAME>",
            "Me My Mo M<SHORT_NAME>",
            "<FULL_NAME>"].joined(separator: "\n")
        
        let song: String = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Nate", shortName: shortName)
        //print(song)
        liricsField.text = song
    }
    
}


func shortNameFromName(name: String) -> String {
    // implementation here
    let lowercaseName = name.lowercased()
    //let vowelSet = CharacterSet(charactersIn: "aeiou")
    let vowelSet : String = "aeiou"
    var shorterName: String = ""
    var hasVowel: Bool = false
    
    for index in lowercaseName.indices {
        print("\(lowercaseName[index]) ", terminator: "")
        var character : Character = lowercaseName[index]
        if (!hasVowel && vowelSet.contains(character)) {
            hasVowel = true
        }
        if (hasVowel) {
            shorterName.append(character)
        }
    }
    
    if (shorterName.isEmpty) {
        shorterName = name
    }
    return shorterName
}

func lyricsForName(lyricsTemplate: String, fullName: String, shortName: String) -> String {
    // ...
    var result : String = lyricsTemplate
    result = (result as NSString).replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    result = (result as NSString).replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return result
}
