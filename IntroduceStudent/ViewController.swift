//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Taibou Balde on 12/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var majorNameTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
         
         numberOfPetsLabel.text = "\(Int(sender.value))"
     }
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
           
           // Let's us chose the title we have selected from the segmented control
           let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
           
           // Creating a variable of type string, that holds an introduction. The introduction interpolates the values from the text fields provided.
           // Currently we can only present the information in a print statement. However, this lets us verify that our app is printing out what is intended!
        let introduction = " Hello! My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I am a \(year!) year student at \(schoolNameTextField.text!) where I study \(majorNameTextField.text!). I own \(numberOfPetsLabel.text!) dogs but it is \(morePetsSwitch.isOn) that I want more pets."
           
           
           // Creates the alert where we pass in our message, which our introduction.
           let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
           
           // A way to dismiss the box once it pops up
           let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
           
           // Passing this action to the alert controller so it can be dismissed
           alertController.addAction(action)
           
           present(alertController, animated: true, completion: nil)
        
        
        
        //creating user defaults for the general information text fields.
        UserDefaults.standard.set(firstNameTextField.text, forKey: "firstName")
        UserDefaults.standard.set(lastNameTextField.text, forKey: "lastName")
        UserDefaults.standard.set(schoolNameTextField.text, forKey: "schoolName")
        UserDefaults.standard.set(majorNameTextField.text, forKey: "majorName")
        UserDefaults.standard.set(numberOfPetsLabel.text, forKey: "label")
        
       }
    
    
    
    @IBOutlet weak var themeSegment: UISegmentedControl!
    
    
    //creating variables to use as keys when doing user defaults for background change.
    let COLOR_KEY = "colorKey"
    let RED_COLOR = "redColor"
    let ORANGE_COLOR = "orangeColor"
    let YELLOW_COLOR = "yellowColor"
    let GREEN_COLOR = "greenColor"
    let BLUE_COLOR = "blueColor"
    let VIOLET_COLOR = "violetColor"
    let WHITE_COLOR = "whiteColor"

    override func viewDidLoad() {
        super.viewDidLoad()
        //methods to get color and correct switch position
        updateTheme()
        switchCheck()
       // changeColor()
        // Do any additional setup after loading the view.
        
        
        //variables calling for whatever values was inside the text fields
        let first = UserDefaults.standard.string(forKey: "firstName")
        let last = UserDefaults.standard.string(forKey: "lastName")
        let school = UserDefaults.standard.string(forKey: "schoolName")
        let major = UserDefaults.standard.string(forKey: "majorName")
        let label = UserDefaults.standard.string(forKey: "label")
        
        
        
        //if the variables  (as mentioned above) have a real value, set text field as that. Else, leave blank
        if first != nil {
            firstNameTextField.text = first
        }
        else {
            firstNameTextField.text = ""
        }
        if last != nil {
            lastNameTextField.text = last
        }
        else {
            lastNameTextField.text = ""
        }
        if school != nil {
            schoolNameTextField.text = school
        }
        else {
           schoolNameTextField.text = ""
        }
        if major != nil {
            majorNameTextField.text = major
        }
        else {
            majorNameTextField.text = ""
        }
        if label != nil {
            numberOfPetsLabel.text = label
        }
        else {
            numberOfPetsLabel.text = ""
        }
        
        
        //function to check position of the more pets switch and stores how it is
        func switchCheck() {
            if(UserDefaults.standard.bool(forKey: "morePets")){
                morePetsSwitch.setOn(true, animated: false)
            }
            else{
                morePetsSwitch.setOn(false, animated: false)
            }
        }
        
        }
    
    //two methods below stores / sets color of the background
    
    func updateTheme()
    {
        let color = UserDefaults.standard.string(forKey: COLOR_KEY)
                   if (color == RED_COLOR){
                       themeSegment.selectedSegmentIndex = 0
                       view.backgroundColor = UIColor.systemRed
                   }
                   else if (color == ORANGE_COLOR){
                       themeSegment.selectedSegmentIndex = 1
                       view.backgroundColor = UIColor.systemOrange
                   }
                   else if (color == YELLOW_COLOR){
                       themeSegment.selectedSegmentIndex = 2
                       view.backgroundColor = UIColor.systemYellow
                   }
                   else if (color == GREEN_COLOR){
                       themeSegment.selectedSegmentIndex = 3
                       view.backgroundColor = UIColor.systemGreen
                   }
                   else if (color == BLUE_COLOR){
                       themeSegment.selectedSegmentIndex = 4
                       view.backgroundColor = UIColor.systemBlue
                   }
                   else if (color == VIOLET_COLOR){
                       themeSegment.selectedSegmentIndex = 5
                       view.backgroundColor = UIColor.systemPurple
                   }
                   else if (color == WHITE_COLOR){
                       themeSegment.selectedSegmentIndex = 5
                       view.backgroundColor = UIColor.white
                   }
    }
    
    

        
    @IBAction func segmentChanged(_ sender: Any) {
        
        switch themeSegment.selectedSegmentIndex
                    {
                    case 0:
                        UserDefaults.standard.set(RED_COLOR, forKey: COLOR_KEY)
                    case 1:
                        UserDefaults.standard.set(ORANGE_COLOR, forKey: COLOR_KEY)
                    case 2:
                        UserDefaults.standard.set(YELLOW_COLOR, forKey: COLOR_KEY)
                    case 3:
                        UserDefaults.standard.set(GREEN_COLOR, forKey: COLOR_KEY)
                    case 4:
                        UserDefaults.standard.set(BLUE_COLOR, forKey: COLOR_KEY)
                    case 5:
                        UserDefaults.standard.set(VIOLET_COLOR, forKey: COLOR_KEY)
                    default:
                        UserDefaults.standard.set(WHITE_COLOR, forKey: COLOR_KEY)
                    }
                    updateTheme()
    }
    
    
    
    @IBAction func switchOnOff(_ sender: Any) {
        if (morePetsSwitch.isOn){
            UserDefaults.standard.set(true, forKey: "morePets")
        }
        else {
            UserDefaults.standard.set(false, forKey: "morePets")
        }
    }
    }



