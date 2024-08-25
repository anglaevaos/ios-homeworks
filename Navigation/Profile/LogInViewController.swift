
import UIKit

class LogInViewController: UIViewController {
    
    private let notificationCenter = NotificationCenter.default
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
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
    
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor?.withAlphaComponent(0.8)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)// уточнить
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .disabled)//уточнить
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .highlighted)//уточнить
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .selected)//уточнить
        
        button.addTarget(self, action: #selector(buttonTappedToProfile), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            super.viewWillDisappear(animated)
            notificationCenter.addObserver(self,selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            notificationCenter.addObserver(self,selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
        override func viewWillDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
        @objc private func keyboardShow(notification: NSNotification) {
            if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
    
                scrollView.contentInset.bottom = keyboardHeight
                scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            }
        }
    
        @objc private func keyboardHide() {
            scrollView.contentInset = .zero
            scrollView.verticalScrollIndicatorInsets = .zero
        }

    
    
    private func setupLayout() {
        view.addSubview(scrollView)
                
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(logInButton)
        contentView.addSubview(emailPhoneTextField)
        contentView.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            
            logoImageView.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 220),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            
            emailPhoneTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emailPhoneTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120.5),
            emailPhoneTextField.heightAnchor.constraint(equalToConstant: 50),
            emailPhoneTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),//отступ слева 16
            emailPhoneTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 170),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),//отступ слева 16
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    

    @objc private func buttonTappedToProfile() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
}











