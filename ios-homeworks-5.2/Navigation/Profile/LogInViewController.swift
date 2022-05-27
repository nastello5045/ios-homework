//
//  LogInViewController.swift
//  Navigation
//
//  Created by Елена on 18.03.2022.
//
import UIKit

class LogInViewController: UIViewController {
    
   

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isUserInteractionEnabled = true
        scrollView.isExclusiveTouch = true
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFill
        return logoImageView
    }()
    
    private let textFieldsStackView: UIStackView = {
        let textFieldsStackView = UIStackView()
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldsStackView.axis = .vertical
        textFieldsStackView.layer.borderWidth = 0.5
        textFieldsStackView.layer.borderColor = UIColor.lightGray.cgColor
        textFieldsStackView.layer.cornerRadius = 10
        textFieldsStackView.clipsToBounds = true
        
        return textFieldsStackView
    }()
    
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.backgroundColor = .systemGray6
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        emailTextField.placeholder = "Email or phone"
        emailTextField.autocapitalizationType = .none
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailTextField.textColor = .black
        
        
        return emailTextField
        
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocapitalizationType = .none
      
        return passwordTextField
        
    }()
    
    private let betweenLine: UIView = {
        let betweenLine = UIView()
        betweenLine.backgroundColor = .lightGray
        betweenLine.translatesAutoresizingMaskIntoConstraints = false
        return betweenLine
    }()
    
    private let logInButton: UIButton = {
        let logInButton = UIButton()
        let backgroundImage = UIImage(named: "blue_pixel")
        let imageWithAlpha = backgroundImage?.alpha(0.8)
 
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setBackgroundImage(backgroundImage, for: .normal)
        logInButton.setBackgroundImage(imageWithAlpha, for: .highlighted)
        logInButton.setBackgroundImage(imageWithAlpha, for: .selected)
        logInButton.setBackgroundImage(imageWithAlpha, for: .disabled)
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true
        
        logInButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
 
        

        return logInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.becomeFirstResponder()
        configureSubviews()
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func configureSubviews() {
        view.addSubview(scrollView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(textFieldsStackView)
        textFieldsStackView.addArrangedSubview(emailTextField)
        textFieldsStackView.addArrangedSubview(betweenLine)
        textFieldsStackView.addArrangedSubview(passwordTextField)
        contentView.addSubview(logInButton)
        scrollView.addSubview(contentView)
        scrollView.contentSize = CGSize(width: contentView.frame.width, height: contentView.frame.height)
    }
    
    @objc private func tapButton() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
       
    }
    

    
   @objc private func kbdShow(notification: NSNotification) {
       if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
           scrollView.contentInset.bottom = kbdSize.height + logInButton.frame.height
           scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,left: 0, bottom: kbdSize.height, right: 0)
       }
   }
   
    @objc private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
    
    private func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        //Add scrollView constraints
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor))
        constraints.append(scrollView.topAnchor.constraint(equalTo: self.view.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor))
        
        //Add contentView constraints
        constraints.append(contentView.leadingAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.leadingAnchor))
        constraints.append(contentView.trailingAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.trailingAnchor))
        constraints.append(contentView.topAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.topAnchor))
        constraints.append(contentView.bottomAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.bottomAnchor))
        constraints.append(contentView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor))
        constraints.append(contentView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
    
        
        //Add logoImageView constraints
        constraints.append(logoImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor))
        constraints.append(logoImageView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 120))
        constraints.append(logoImageView.heightAnchor.constraint(equalToConstant: 100))
        constraints.append(logoImageView.widthAnchor.constraint(equalToConstant: 100))
        
        //Add textFieldsStackView constraints
        constraints.append(textFieldsStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16))
        constraints.append(textFieldsStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16))
        constraints.append(textFieldsStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120))
        
        //Add textField constraints
        constraints.append(emailTextField.widthAnchor.constraint(equalTo:textFieldsStackView.widthAnchor))
        constraints.append(passwordTextField.widthAnchor.constraint(equalTo:textFieldsStackView.widthAnchor))
        constraints.append(betweenLine.widthAnchor.constraint(equalTo:textFieldsStackView.widthAnchor))
        constraints.append(passwordTextField.heightAnchor.constraint(equalToConstant: 49.5))
        constraints.append(emailTextField.heightAnchor.constraint(equalToConstant: 49.5))
        constraints.append(betweenLine.heightAnchor.constraint(equalToConstant: 0.5))
        
        //Add logInButton constraints
        constraints.append(logInButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 16))
        constraints.append(logInButton.leadingAnchor.constraint(equalTo: textFieldsStackView.leadingAnchor))
        constraints.append(logInButton.trailingAnchor.constraint(equalTo: textFieldsStackView.trailingAnchor))
        constraints.append(logInButton.heightAnchor.constraint(equalToConstant: 50))
                           
                           
        //Activate constraints
        NSLayoutConstraint.activate(constraints)
    }
}

extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image{_ in
            draw(at: .zero, blendMode: .normal, alpha: value)
        }
    }
}
