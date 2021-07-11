//
//  RSViewController.swift
//  rs.ios-stage.task-7-swift
//
//  Created by Andrew Pokachailo on 7/8/21.
//

import UIKit



class RSViewController: UIViewController, UITextFieldDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authorizeButton.addTarget(self, action: #selector(authorizeButtonTap(_:)), for: .touchUpInside)
        self.firstButton.addTarget(self, action: #selector(secretViewState(_:)), for: .touchUpInside)
        self.secondButton.addTarget(self, action: #selector(secretViewState(_:)), for: .touchUpInside)
        self.thirdButton.addTarget(self, action: #selector(secretViewState(_:)), for: .touchUpInside)
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismisKeyboard)))

    }
    
    @IBOutlet weak var authorizeButton: RSAuthorizeButton!
    @IBOutlet weak var loginTextField: RSTextField!
    @IBOutlet weak var passwordTextField: RSTextField!
    @IBOutlet weak var secretView: RSSecretView!
    // result label
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstButton: RSSecretButton!
    @IBOutlet weak var secondButton: RSSecretButton!
    @IBOutlet weak var thirdButton: RSSecretButton!
    
    
    
    @objc func authorizeButtonTap(_ sender: UIButton) {
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        if login == "username" {
            self.loginTextField.setStatement(statement: .success)
        } else {
            self.loginTextField.setStatement(statement: .error)
        }
        
        if password == "password" {
            self.passwordTextField.setStatement(statement: .success)
        } else {
            self.passwordTextField.setStatement(statement: .error)
        }
        
        if login == "username" && password == "password" {
            self.loginTextField.setStatement(statement: .success)
            self.loginTextField.alpha = 0.5;
            self.loginTextField.isEnabled = false
            
            self.passwordTextField.setStatement(statement: .success)
            self.passwordTextField.alpha = 0.5
            self.passwordTextField.isEnabled = false
            
            self.authorizeButton.isEnabled = false
            
            self.secretView.isHidden = false
        }
    }
    
    
    
    @objc func secretViewState(_ sender: UIButton) {
        if self.resultLabel.text == "-" {
            self.resultLabel.text = ""
        }
        self.resultLabel.text?.append("\(sender.titleLabel?.text ?? "")")
        if self.resultLabel.text?.count == 3 {
            if self.resultLabel.text == "132" {
                self.secretView.setStatement(statement: .success)
                alertMessage()
            } else {
                self.secretView.setStatement(statement: .error)
                self.resultLabel.text = "-"
            }
        }
        
    }
    
    func alertMessage() {
        let alert = UIAlertController(title: "Welcome", message: "You are successfuly authorized!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Refresh", style: .default, handler: {action in
            self.loginTextField.reset()
            self.passwordTextField.reset()
            self.secretView.reset()
            self.authorizeButton.reset()
            self.resultLabel.text = "-"
        })
        alert.view.tintColor = .red
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
//    MARK: Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blackCoral.cgColor
    }
    
    @objc func dismisKeyboard() {
        self.view.endEditing(true)
    }
    
}
