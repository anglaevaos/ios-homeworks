
import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        view.backgroundColor = .systemCyan
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .red
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    
    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        return logoImageView
    }()
    
    private let emailPhoneTextField: UITextField = {
        let emailPhoneTextField = UITextField()
        emailPhoneTextField.placeholder = "Email or phone"
        if #available(iOS 16.0, *) {
            emailPhoneTextField.font = .systemFont(ofSize: 16, weight: .regular, width: .standard)
        } else {
            print("Fallback on earlier versions")
        }
        emailPhoneTextField.textColor = UIColor.black
        emailPhoneTextField.tintColor = UIColor.systemGray2
        emailPhoneTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailPhoneTextField.layer.cornerRadius = 10
        emailPhoneTextField.layer.borderWidth = 0.5
        emailPhoneTextField.layer.masksToBounds = true
        emailPhoneTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        emailPhoneTextField.backgroundColor = UIColor.systemGray6
        emailPhoneTextField.autocapitalizationType = .none
        emailPhoneTextField.isSecureTextEntry = false
        emailPhoneTextField.autocorrectionType = UITextAutocorrectionType.no
        emailPhoneTextField.keyboardType = UIKeyboardType.default
        emailPhoneTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        emailPhoneTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        emailPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailPhoneTextField
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        if #available(iOS 16.0, *) {
            passwordTextField.font = .systemFont(ofSize: 16, weight: .regular, width: .standard)
        } else {
            print("Fallback on earlier versions")
        }
        passwordTextField.textColor = UIColor.black
        passwordTextField.tintColor = UIColor.systemGray
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.backgroundColor = UIColor.systemGray6
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = UITextAutocorrectionType.no
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    
    let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)// уточнить
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .disabled)//уточнить
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .highlighted)//уточнить
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .selected)//уточнить
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupScrollView()
        setupUI()
        addConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // Установка ограничений для scrollView
        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        
//        // Установка ограничений для contentView
//            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    
    private func setupUI() {
        view.addSubview(logoImageView)
        view.addSubview(logInButton)
        view.addSubview(emailPhoneTextField)
        view.addSubview(passwordTextField)
    }
    
    
    private func addConstraint(){
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            emailPhoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailPhoneTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            emailPhoneTextField.heightAnchor.constraint(equalToConstant: 50),
            emailPhoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),//отступ слева 16
            emailPhoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 170),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),//отступ слева 16
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 236),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),//отступ слева 16
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        // Установка ограничений для contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    @objc private func buttonTapped() {
        emailPhoneTextField.text = "Email or phone"
    }
    
}




