//
//  ViewController.swift
//  Bankey
//
//  Created by Gaspar Dolcemascolo on 27/10/2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let subtitleLabel = UILabel()
    
    var username: String? {
        return loginView.userNameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "Your premium source for all things banking!"
        subtitleLabel.numberOfLines = 2
        subtitleLabel.isHidden = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 1
        errorMessageLabel.text = "Error label"
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // SubtitleLabel
        NSLayoutConstraint.activate([
            subtitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 1),
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),  // Aqui view se colocara a 8px despues de loginView, equalToSystemSpacingAfter coloca el elemento despues del siguiente elemento
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 6),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // ErrorLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 4),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

// MARK: Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        signInButton.configuration?.showsActivityIndicator = false
        login()
       
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password never be empty")
            return
        }
        
        let DEFAULT_USER = "Gaspar"
        let DEFAULT_PASSWORD = "123"
        
        if username.isEmpty || password.isEmpty  {
            configureView(withMessage: "Username / password never be empty")
            return
        } else if username != DEFAULT_USER || password != DEFAULT_PASSWORD {
            configureView(withMessage: "Incorrect Username / password")
            return
        }
        
        signInButton.configuration?.showsActivityIndicator = true
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
