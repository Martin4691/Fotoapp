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
    
    @IBAction func resetAction(_ sender: Any) {

        let refreshAlert = UIAlertController(title: "Are you sure?", message: "All data will be lost.", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            UserDefaults.standard.removeObject(forKey: self.nameEmailKey)
            print("Reset Done!")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            print("Reset Aborted")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
        
    }
    
    
}



