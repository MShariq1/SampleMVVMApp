//
//  ViewController.swift
//  MVVM Sample
//
//  Created by Shariq on 2023-10-12.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var vuPassword: UIView!
    @IBOutlet weak var vuMain: UIView!
    @IBOutlet weak var vuEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }

    @IBAction func onSignIn(_ sender: Any) {
        
        if txtEmail.text == "" || txtPassword.text == "" {
            self.showToast(message: "Please fill all fields")
            return
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func setupUI() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = true
        vuMain.layer.cornerRadius = 10
        vuEmail.layer.cornerRadius = 5
        vuPassword.layer.cornerRadius = 5
        btnSignIn.layer.cornerRadius = 20
        vuEmail.layer.borderWidth = 1
        vuPassword.layer.borderWidth = 1
        vuEmail.layer.borderColor = UIColor.lightGray.cgColor
        vuPassword.layer.borderColor = UIColor.lightGray.cgColor
        
        txtEmail.text = "test@gmail.com"
        txtPassword.text = "testtest"
    }
    
}

extension UIViewController {

func showToast(message : String) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 120 , y: self.view.frame.size.height-100, width: 250, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = UIFont.systemFont(ofSize: 15.0)
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
