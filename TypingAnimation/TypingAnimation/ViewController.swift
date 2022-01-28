//
//  ViewController.swift
//  TypingAnimation
//
//  Created by 순진이 on 2022/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    
    
    var characterIndex = 0.0
    let titleText = "⌨️TypingAnimation"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = ""
        
        for char in titleText {
            print(char)
            print(0.2 * self.characterIndex)
            //print(self.characterIndex)
            print("======")
            Timer.scheduledTimer(withTimeInterval: 0.2 * characterIndex, repeats: false) { timer in
                self.mainLabel.text?.append(char)
            }
            characterIndex += 1
            //print("⭐️ \(characterIndex)")
        }
        
    }


}

