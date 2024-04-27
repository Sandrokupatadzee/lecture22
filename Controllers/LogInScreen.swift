//
//  LogInScreen.swift
//  lecture22
//
//  Created by MacBook Pro on 26.04.24.
//

import UIKit

class LogInScreen: UIViewController {
    
    let setImageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "addImage"), for: .normal)
        return button
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "მომხმარებლის სახელი"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let userNameField: UITextField = {
        let label = UITextField()
        label.textColor = .label
        label.placeholder = "  შეიყვანეთ მომხმარებლის სახელი"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.backgroundColor = .tertiarySystemBackground
        label.layer.cornerRadius = 18
        label.clipsToBounds = true
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "პაროლი"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let passwordField: UITextField = {
        let label = UITextField()
        label.textColor = .label
        label.isSecureTextEntry = true
        label.placeholder = "  შეიყვანეთ პაროლი"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.backgroundColor = .tertiarySystemBackground
        label.layer.cornerRadius = 18
        label.clipsToBounds = true
        return label
    }()
    
    private let passwordSecondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "გაიმეორეთ პაროლი"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let passwordSecondField: UITextField = {
        let label = UITextField()
        label.textColor = .label
        label.isSecureTextEntry = true
        label.placeholder = "  განმეორებით შეიყვანეთ პაროლი"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.backgroundColor = .tertiarySystemBackground
        label.layer.cornerRadius = 18
        label.clipsToBounds = true
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("რეგისტრაცია", for: .normal)
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        return button
    }()
    
    private let accountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "უკვე გაქვთ ანგარიში?"
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    private let logInDirectly: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("შესვლა", for: .normal)
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        printSavedCredentials()
        
#warning("აქ უბრალოდ ვშლიდი დამახსოვრებულებს")
        
//                let keyChainVC = KeyChainVC()
//                do {
//                    try keyChainVC.delete(service: "CountryApp", account: "username")
//                    try keyChainVC.delete(service: "CountryApp", account: "password")
//                } catch { return }
        
#warning("ეს მგონი არ მუშაობს, იმედია ავამშავებ")
        
        let isFirstTimeRegistration = UserDefaults.standard.bool(forKey: "პირველადრეგისტრირებული")
        if isFirstTimeRegistration {
            let alert = UIAlertController(title: "Welcome!", message: "Thank you for registering.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            UserDefaults.standard.set(false, forKey: "პირველადრეგისტრირებული")
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(setImageButton)
        view.addSubview(userNameLabel)
        view.addSubview(userNameField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(passwordSecondLabel)
        view.addSubview(passwordSecondField)
        view.addSubview(registerButton)
        view.addSubview(accountLabel)
        view.addSubview(logInDirectly)
        
        setImageButton.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecondLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordSecondField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        logInDirectly.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            setImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            setImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setImageButton.heightAnchor.constraint(equalToConstant: 135),
            setImageButton.widthAnchor.constraint(equalToConstant: 135),
            
            userNameLabel.topAnchor.constraint(equalTo: setImageButton.bottomAnchor, constant: 15),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            userNameField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userNameField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: userNameField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordSecondLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            passwordSecondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            passwordSecondField.topAnchor.constraint(equalTo: passwordSecondLabel.bottomAnchor, constant: 10),
            passwordSecondField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordSecondField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordSecondField.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: passwordSecondField.bottomAnchor, constant: 20),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            
            accountLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 40),
            accountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logInDirectly.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 10),
            logInDirectly.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInDirectly.heightAnchor.constraint(equalToConstant: 50),
            logInDirectly.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        registerButton.addAction(UIAction(handler: { [weak self] _ in
            self?.registerButtonTapped()
        }), for: .touchUpInside)
        
        logInDirectly.addAction(UIAction(handler: { [weak self] _ in
            self?.logInButtonTapped()
        }), for: .touchUpInside)
        
        setImageButton.addAction(UIAction(handler: { [weak self] _ in
            self?.setImageButtonTapped()
        }), for: .touchUpInside)
    }
    
    @objc private func registerButtonTapped() {
        guard let username = userNameField.text, !username.isEmpty,
              let password = passwordField.text, !password.isEmpty else {return}
        
        do {
            try KeyChainVC.save(service: "CountryApp", account: "username", password: username.data(using: .utf8)!)
            try KeyChainVC.save(service: "CountryApp", account: "password", password: password.data(using: .utf8)!)
            
            let alert = UIAlertController(title: "Congratulations!", message: "You have successfully registered.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
                self?.navigateToMainScreen()
            }))
            present(alert, animated: true, completion: nil)
            
        } catch {
            print("Error saving credentials to Keychain")
            return
        }
    }
    
    private func navigateToMainScreen() {
        let mainScreen = MainScreen()
        navigationController?.pushViewController(mainScreen, animated: true)
    }
    
    @objc private func logInButtonTapped() {
        if KeyChainVC.credentialsAreSaved() {
            let mainScreen = MainScreen()
            navigationController?.pushViewController(mainScreen, animated: true)
        } else {
            let alert = UIAlertController(title: "Credentials not saved", message: "You need to register first.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc private func setImageButtonTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    private func printSavedCredentials() {
        guard let usernameData = KeyChainVC.get(service: "CountryApp", account: "username"),
              let username = String(data: usernameData, encoding: .utf8),
              let passwordData = KeyChainVC.get(service: "CountryApp", account: "password"),
              let password = String(data: passwordData, encoding: .utf8) else {
            print("No saved credentials found")
            return
        }
        
        print("Saved username: \(username)")
        print("Saved password: \(password)")
    }
}
// MARK: - LogInScreen extension - PS ეს კოდი გადმოკოპირებულია

extension LogInScreen: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info:
                               [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {return}
        
        setImageButton.setImage(image, for: .normal)
        
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                             in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("რაღაცა")
            do {
                try image.jpegData(compressionQuality: 1.0)?.write(to: fileURL)
                print("დასეივდა: \(fileURL)")
            } catch {
                print("არ დასეივდა: \(error)")
            }
        }
    }
}
