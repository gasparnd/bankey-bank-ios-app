//
//  DummyViewController.swift
//  Bankey
//
//  Created by Gaspar Dolcemascolo on 01/11/2024.
//

import UIKit

class DummyViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)
    
    weak var delegate: DummyViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Home Screen"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        // Button
        logoutButton.translatesAutoresizingMaskIntoConstraints =  false
        logoutButton.setTitle("Log out", for: [])
        logoutButton.configuration = .filled()
        logoutButton.configuration?.imagePadding = 8
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: Actions
extension DummyViewController {
    @objc func logoutButtonTapped(_ sender: UIButton) {
        LocalState.hasOnboading = true
        delegate?.didLogout()
    }
}

