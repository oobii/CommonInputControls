//
//  ViewController.swift
//  CommonInputControls
//
//  Created by martynov on 2017-09-24.
//  Copyright © 2017 martynov. All rights reserved.
//
// test new global git email

import UIKit

// KBRD 1
class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        self.myTextLabel.text = "x: \(location.x) y: \(location.y)"
        print(location)
        
    }
    
    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var slider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // KBRD 1
        myTextField.delegate = self
        
        // we break the connection in the Connection Inspector
        // and add programatically, first creating IBOutlet
        // to get the button to work with
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
    }

    // Need this code to remove the keyboard, it's done by
    // resinging to be first responder 
    // KBRD 1 - marked the needed code
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        
        if let text = myTextField.text {
            print("textFieldShouldReturn delegate implementation:" + text)
            self.myTextLabel.text = text
        }
        // explicit call of "action"
        keyboardReturnTapped(myTextField)
        
        return true
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        let toggleStatusStr = toggle.isOn ? "toggle is On" : "toggle is OFF"
        let sliderValueStr = String(slider.value)
        self.myTextLabel.text = "Print text " + toggleStatusStr + " slider at " + sliderValueStr
        print("Button was tapped!")
    }
    
    @IBAction func switchingStaff(_ sender: UISwitch) {
        if sender.isOn {
            self.myTextLabel.text = "The switch is ON"
            print("The switch is ON")
        } else {
            self.myTextLabel.text = "The switch is OFF"
            print("The switch os OFF")
        }
    }
    
    
    @IBAction func sliderValueChanges(_ sender: UISlider) {
        
        self.myTextLabel.text = String(sender.value)
        print(sender.value)
    }
    
// If UITextFieldDelegate is defined then this one is not called after myTextField.resignFirstResponder()
    // we call it inside vi
    @IBAction func keyboardReturnTapped(_ sender: UITextField) {
        
        if let text = sender.text {
            print("keyboardReturnTapped action:" + text)
            self.myTextLabel.text = text
        }
    }
    
    
  // We check if tis one gets called as it is by itself without 
 //    clling it inside textFieldShouldReturn delegate implementation
    @IBAction func textFieldEditingEnded(_ sender: UITextField) {
        
        if let text = sender.text {
            print("textFieldEditingEnded action:" + text)
            self.myTextLabel.text = text
        }

    }

    @IBAction func textChanged(_ sender: UITextField) {
        
        if let text = sender.text {
            print(text)
        }
    }
    
    
    @IBOutlet weak var myTextLabel: UILabel!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

