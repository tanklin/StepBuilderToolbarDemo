//
//  ViewController.swift
//  StepBuilderToolbarDemo
//
//  Created by Tank Lin on 2019/1/23.
//  Copyright © 2019 Tank Lin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // UserDefaults Keys
    private static let remeberAccountkey = "RemeberAccountkey"
    private static let myAccountKey = "MyAccountKey"
    
    let accountTextField: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Please enter your account"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.placeholder = "Please enter your password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .red
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 5
        btn.setTitle("Log in", for: .normal)
        btn.addTarget(self, action: #selector(onTapLogin(_:)), for: .touchUpInside)
        return btn
    }()

    override func loadView() {
        super.loadView()
        navigationItem.title = "Log in"
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(accountTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        setupToolbar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        accountTextField.becomeFirstResponder()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            accountTextField.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            accountTextField.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            accountTextField.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            accountTextField.heightAnchor.constraint(equalToConstant: 44.0)
            ])
        NSLayoutConstraint.activate([
            passwordTextField.safeAreaLayoutGuide.topAnchor.constraint(equalTo: accountTextField.safeAreaLayoutGuide.bottomAnchor, constant: 12),
            passwordTextField.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            passwordTextField.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44.0)
            ])
        NSLayoutConstraint.activate([
            loginButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: passwordTextField.safeAreaLayoutGuide.bottomAnchor, constant: 24),
            loginButton.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            loginButton.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            loginButton.heightAnchor.constraint(equalToConstant: 44.0)
            ])
    }

    @objc func onTapLogin(_ sender: UIButton) {
        print("Login OK!!!")
        view.endEditing(true)
        
        guard let accountText = accountTextField.text else {
            return
        }
        UserDefaults.standard.set(accountText, forKey: LoginViewController.myAccountKey)
        
        let loginSucceedVC = LoginSucceedViewController()
        navigationController?.pushViewController(loginSucceedVC, animated: true)
    }
}


extension LoginViewController {
    
    func setupToolbar() {
        let isMemorized = UserDefaults.standard.bool(forKey: LoginViewController.remeberAccountkey)
        print("AccountMemorizerToolbar isRemember: \(isMemorized)")
        
        let toolbar = AccountMemorizerBuilder
            .builder
            .title("Remember My Account")
            .isMemorized(isMemorized)
            .build()
        if toolbar.isMemorized {
            accountTextField.text = UserDefaults.standard.string(forKey: LoginViewController.myAccountKey)
        }
        toolbar.didTapClosure = { btn in
            print("toolbar.didTapClosure: \(btn.isSelected)")
            UserDefaults.standard.set(btn.isSelected, forKey: LoginViewController.remeberAccountkey)
        }
        accountTextField.inputAccessoryView = toolbar
    }
    
}
