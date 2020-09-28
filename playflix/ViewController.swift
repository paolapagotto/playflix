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
    
    
    @IBAction func actionButtonLogIn(_ sender: UIButton) {
    }
    @IBAction func actionButtonSignIn(_ sender: UIButton) {
    }
    @IBAction func actionButtonForgotPassword(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewLogoPlayflix.image = UIImage(named: "playflix-limpo.png")
        imageViewGoogleSignIn.image = UIImage(named: "google.png")
        imageViewFacebookSignIn.image = UIImage(named: "facebook.png")
    }


}

