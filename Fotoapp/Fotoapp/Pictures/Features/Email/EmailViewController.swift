//
//  EmailViewController.swift
//
//
import Foundation
import UIKit
import MessageUI


class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveOut: UIButton!
    @IBOutlet weak var resetOut: UIButton!
    
    @IBOutlet weak var sendOut: UIButton!
    
    
    private let nameEmailKey: String = "MyNameAndEmailKey"
    
    private var savedKeys: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.cornerRadius = 10
        saveOut.layer.cornerRadius = 10
        resetOut.layer.cornerRadius = 10
        sendOut.layer.cornerRadius = 10
        
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
    
    
    
    @IBAction func sendAct(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
                if MFMailComposeViewController.canSendMail() {
                    self.present(mailComposeViewController, animated: true, completion: nil)
                } else {
                    self.showSendMailErrorAlert()
                }
            }
        
    func configuredMailComposeViewController() -> MFMailComposeViewController {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property

        mailComposerVC.setToRecipients(["\(String(describing: emailTextField.text ?? ""))"])
            mailComposerVC.setSubject("Test email...")
        mailComposerVC.setMessageBody("Hola \(String(describing: nameTextField.text ?? "")),\n", isHTML: false)

            return mailComposerVC
        }
    

func showSendMailErrorAlert() {
    _ = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: UIAlertController.Style.alert)
//        sendMailErrorAlert.show()
    }
    
}


    // MARK: MFMailComposeViewControllerDelegate

    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismiss(animated: true, completion: nil)

    }




