

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = "Waiting for something..."
    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        avatarImageView.image = UIImage(named: "Cat")
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.clipsToBounds = true
        
        return avatarImageView
    }()

    private let fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Hipster Cat"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return fullNameLabel
    }()

    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()

    private let setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.clipsToBounds = true
        setStatusButton.layer.masksToBounds = false
        
        return setStatusButton
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.placeholder = "Type something.."
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return statusTextField
    }()
    
 

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(fullNameLabel)
        self.addSubview(avatarImageView)
        self.addSubview(setStatusButton)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        statusLabel.text = self.statusText
        addConst()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func didTapButton() {
        statusLabel.text = self.statusText
    }
    @objc private func statusTextChanged(_ textField: UITextField) {
        self.statusText = textField.text ?? ""
    }
    func addConst(){
        var constraints = [NSLayoutConstraint]()
        
        //Add Name Constraints
        constraints.append(fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16))
        constraints.append(fullNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27))
        
        //Add Pic Constraints
        constraints.append(avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16))
        constraints.append(avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16))
        constraints.append(avatarImageView.widthAnchor.constraint(equalToConstant: 120))
        constraints.append(avatarImageView.heightAnchor.constraint(equalToConstant: 120))
        
        //Add Button Constraints
        constraints.append(setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16))
        constraints.append(setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16))
        constraints.append(setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40))
        constraints.append(setStatusButton.heightAnchor.constraint(equalToConstant: 50))
        
        //Add Status Constraints
        constraints.append(statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor))
        constraints.append(statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -8))
       
        
        //Add statusTextField Constraints
        constraints.append(statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor))
        constraints.append(statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor))
        constraints.append(statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16))
        constraints.append(statusTextField.heightAnchor.constraint(equalToConstant: 40))
        
        NSLayoutConstraint.activate(constraints)
    }
}


