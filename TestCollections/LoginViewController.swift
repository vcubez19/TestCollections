//
//  SecondViewController.swift
//  TestCollections
//
//  Created by Vincent Cubit on 11/13/21.
//


import UIKit


final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: UI Subviews
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        return textField
    }()
    
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.returnKeyType = .go
        return textField
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 20.0
        button.isEnabled = false
        return button
    }()
    
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password", for: .normal)
        return button
    }()
    
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        return button
    }()
    
    
    // MARK: Other data
    private var size: CGSize = CGSize(width: 0.0,
                                      height: 0.0)
    private var canProceedWithReturnKey: Bool = false
    
    
    // MARK: Initialization Code
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Login"
        
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = .systemBackground
        
        
        self.view.addSubview(self.emailField)
        self.view.addSubview(self.passwordField)
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.signUpButton)
        self.view.addSubview(self.forgotPasswordButton)

        
        self.emailField.addTarget(self, action: #selector(self.checkLength), for: .editingChanged)
        self.passwordField.addTarget(self, action: #selector(self.checkLength), for: .editingChanged)

        
        self.loginButton.addTarget(self,
                                   action: #selector(self.login),
                                   for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self,
                                    action: #selector(self.forgotPassword),
                                    for: .touchUpInside)
        self.signUpButton.addTarget(self,
                                    action: #selector(self.goToSignUp),
                                    for: .touchUpInside)

        
        self.emailField.delegate = self
        self.passwordField.delegate = self
        
        
        self.size = self.view.frame.size


    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.emailField.frame = CGRect(x: 40,
                                       y: self.size.height / 3,
                                       width: self.size.width - 80,
                                       height: 50)
        self.passwordField.frame = CGRect(x: 40,
                                          y: self.emailField.frame.maxY + 30,
                                          width: self.size.width - 80,
                                          height: 50)
        self.loginButton.frame = CGRect(x: 40,
                                        y: self.passwordField.frame.maxY + 30,
                                        width: self.size.width - 80,
                                        height: 50)
        self.signUpButton.frame = CGRect(x: 40,
                                         y: self.size.height - 70,
                                         width: self.size.width - 80,
                                         height: 30)
        self.forgotPasswordButton.frame = CGRect(x: 40,
                                                 y: self.signUpButton.frame.minY - 50,
                                                 width: self.size.width - 80,
                                         height: 30)
        
        
    }
    
    
    // MARK: Methods
    @objc private func login() {
        
        print("Tapped log in")
        
    }
    
    
    @objc func forgotPassword() {
        
        print("Tapped")
        
    }
    
    
    @objc func goToSignUp() {
        
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @objc func checkLength() {
        
        if let email = self.emailField.text {
            if let password = self.passwordField.text {
                if email.count >= 6 && password.count >= 6 {
                    self.loginButton.backgroundColor = .systemBlue
                    self.loginButton.isEnabled = true
                    self.canProceedWithReturnKey = true
                } else {
                    self.loginButton.backgroundColor = .systemGray
                    self.loginButton.isEnabled = false
                    self.canProceedWithReturnKey = false
                }
            }
        }
        
    }
    
    
    // MARK: TextField Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailField {
            self.passwordField.becomeFirstResponder()
        } else {
            if self.canProceedWithReturnKey {
                textField.resignFirstResponder()
                self.login()
            } else {
                print("Show some")
            }
        }
        
        
        return true
        
    }
    

}

