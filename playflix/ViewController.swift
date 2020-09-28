//
//  ViewController.swift
//  playflix
//
//  Created by Paola Pagotto on 28/09/2020.
//  Copyright © 2020 Paola Pagotto. All rights reserved.
//

import UIKit


@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

@IBDesignable extension UILabel {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}



class ViewController: UIViewController {
    

    
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var imageViewGoogleSignIn: UIImageView!
    @IBOutlet weak var imageViewFacebookSignIn: UIImageView!
    @IBOutlet weak var imageViewLogoPlayflix: UIImageView!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var buttonLogIn: UIButton!
    
    @IBAction func actionButtonLogIn(_ sender: UIButton) {
        
        if validateInfo() {
            buttonLogIn.isEnabled = true
            buttonLogIn.backgroundColor = UIColor.purple
        }
    }
    @IBAction func actionButtonSignIn(_ sender: UIButton) {
    }
    @IBAction func actionButtonForgotPassword(_ sender: UIButton) {
    }

    var arrayUsers = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewLogoPlayflix.image = UIImage(named: "playflix-limpo.png")
        imageViewGoogleSignIn.image = UIImage(named: "google.png")
        imageViewFacebookSignIn.image = UIImage(named: "facebook.png")
        
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
        buttonLogIn.isEnabled = false
        
    }
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z.]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "[A-Za-z0-9]{6,12}"
        
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    private func validateInfo() -> Bool {
        let user = User(email: textFieldEmail.text!,
                        password: textFieldPassword.text!)
        if !isValidEmail(textFieldEmail.text!)
        {
            print("Valid e-mail is required!")
            return false
        }
        if !isValidPassword(textFieldPassword.text!)
        {
            print("Password is required!")
            return false
        }
        print("User successfully signed up! ")
        buttonLogIn.isEnabled = true
        user.email = textFieldEmail.text ?? "E-mail is not valid"
        print(user.email)
        return true
    }
    
    private func cleanTextFields() {
        textFieldEmail.text = ""
        textFieldPassword.text = ""
    }
}


extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldEmail {
            textFieldPassword.becomeFirstResponder()
        } else {
            if validateInfo() {
                textField.resignFirstResponder()
            }
        }
        return true
    }
}


