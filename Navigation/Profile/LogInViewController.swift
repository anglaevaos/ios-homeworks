
import UIKit


class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    //2 создаем делегат logininspector
    weak var loginDelegate: LoginViewControllerDelegate?
    
    public let notificationCenter = NotificationCenter.default
    
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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0.5
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = .lightGray
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        return stackView
    }()
    
    private lazy var emailPhoneTextField: UITextField = {
        let emailPhoneTextField = UITextField()
        emailPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        emailPhoneTextField.placeholder = "Email or phone"
        emailPhoneTextField.textColor = .black
        emailPhoneTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailPhoneTextField.autocapitalizationType = .none
        emailPhoneTextField.backgroundColor = .systemGray6
        emailPhoneTextField.delegate = self
        return emailPhoneTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        //        passwordTextField.indent(size: 10)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.delegate = self
        return passwordTextField
    }()
    
    
    
    private lazy var logInButton: UIButton = {
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
        
        [logoImageView, stackView, logInButton].forEach { contentView.addSubview($0) }
        [emailPhoneTextField, passwordTextField].forEach { stackView.addArrangedSubview($0) }
        
        
        NSLayoutConstraint.activate([
            
            logoImageView.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 220),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            emailPhoneTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    
    
    public let userService = CurrentUserService(currentUser: User(userLogin: "Barbara", userFullname: "Barbie", userStatus: "Hi, Ken!", userAvatar: UIImage(named: "19")))
    
    
    
    @objc private func buttonTappedToProfile() {
        
        
#if DEBUG
        let user = TestUserService().getUser(by: emailPhoneTextField.text!)
#else
        let user = userService.getUser(by: emailPhoneTextField.text!)
#endif
        
        if user == nil {
            showAlert("Неверный логин")
        }
        
        let profileVC = ProfileViewController(user: user)
        navigationController?.pushViewController(profileVC, animated: true)
        
        let loginInspector = LoginInspector()
        
        //3 вызывваем делегат
        
        let result = loginInspector.check(login: "mylogin", password: "mypassword")
        print(result)
        self.loginDelegate = loginInspector
        
        
        
        if let delegate = self.loginDelegate {
            let isValid = delegate.check(login: "mylogin", password: "mypassword")
            if isValid {
                print("Login successful!")
            } else {
                showAlert("Invalid username or password.")
            }
            
        }
        
    }
    
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
        
}
