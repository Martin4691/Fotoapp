//
//  EmailViewController.swift
//
//

import UIKit

class EmailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveOut: UIButton!
    @IBOutlet weak var resetOut: UIButton!
    
    private let nameEmailKey: String = "MyNameAndEmailKey"
    
    private var savedKeys: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.cornerRadius = 10
        saveOut.layer.cornerRadius = 10
        resetOut.layer.cornerRadius = 10
        
        if let storedValue: [String] = UserDefaults.standard.stringArray(forKey: nameEmailKey) {
            savedKeys.append(contentsOf: storedValue)
            print("Stored value: \(savedKeys)")
        }
        for key in savedKeys {
            textView.text.append("\n" + key)
        }
    }
    
    @IBAction func saveTouched(_ sender: Any) {
        guard let name = nameTextField.text,
              let email = emailTextField.text else { return }
        
        let fullString: String = "\(name);\(email)"
        savedKeys.append(fullString)
        UserDefaults.standard.set(savedKeys, forKey: nameEmailKey)
        UserDefaults.standard.synchronize()
        print("\(savedKeys)")
    }
    
    
    @IBAction func resetAction(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Are you sure?", message: "All data will be lost.", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            UserDefaults.standard.removeObject(forKey: self.nameEmailKey)
            UserDefaults.standard.synchronize()
            print("Reset Done!")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            print("Reset Aborted")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
}



