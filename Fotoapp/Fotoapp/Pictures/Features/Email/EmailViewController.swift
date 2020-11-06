//
//  EmailViewController.swift
//
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    private let nameEmailKey: String = "MyNameAndEmailKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let storedValue: String = UserDefaults.standard.string(forKey: nameEmailKey) {
            textView.text.append("\n" + storedValue)
            print("Stored value: \(storedValue)")
        }
    }
    
    @IBAction func saveTouched(_ sender: Any) {
        guard let name = nameTextField.text,
            let email = emailTextField.text else { return }
        
        let fullString: String = "\(name);\(email)"
        UserDefaults.standard.set(fullString, forKey: nameEmailKey)
    }
}



