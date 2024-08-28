
import UIKit

class ProfileHeaderView: UIView {
    
    
    private var statusText: String = ""
    private let defaultStatusText: String = "Enter your status here"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Аbout Me"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let customHeightImage = 100
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tobi")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = CGFloat(customHeightImage/2)
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = (UIColor(white: 242.0/255.0, alpha: 1.0)).cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.textColor = .darkGray
        textView.text = "Enter your status here"
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.isEditable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Something about you"
        
        if #available(iOS 16.0, *) {
            textField.font = .systemFont(ofSize: 15, weight: .regular, width: .standard)
        } else {
            print ("Fallback on earlier versions")
        }
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true
        textField.backgroundColor = UIColor.white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.cornerRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addTarget()
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        addTarget()
        addConstraint()
    }
    
    
    private func setupView() {
        self.backgroundColor = UIColor.systemGray2
        addSubview(titleLabel)
        addSubview(profileImageView)
        addSubview(textView)
        addSubview(actionButton)
        addSubview(nameTextField)
    }
    
    private func addTarget() {
        nameTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor), // расположение в центре
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27), // закрепление сверху
            titleLabel.heightAnchor.constraint(equalToConstant: 27), // отступ
            
            //           profileImageView.widthAnchor.constraint(equalToConstant: CGFloat(customHeightImage),
            profileImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),// расположение на экране - слева
            profileImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16), //отступ сверху от safeArea
            profileImageView.widthAnchor.constraint(equalToConstant: 100), //ширина
            profileImageView.heightAnchor.constraint(equalToConstant: 100),//высота
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16), // отступ
            
            
            textView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor, constant: 30),//по цетру
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),//отступ сверху
            textView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),//ширина
            textView.heightAnchor.constraint(equalToConstant: 100),// высота 16
            
            
            nameTextField.centerXAnchor.constraint(equalTo: textView.centerXAnchor),//по центру по Х
            nameTextField.centerYAnchor.constraint(equalTo: textView.centerYAnchor, constant: 15),//по центру по Y
            nameTextField.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),//ширина
            nameTextField.heightAnchor.constraint(equalToConstant: 40),//высота
            nameTextField.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 50),//сверху от textView 50 pt
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),//слева отступ 16 pt
            
            
            actionButton.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor),// по центру Х
            //                actionButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),//сверху от изображения с отступом в 16
            actionButton.topAnchor.constraint(equalTo:  nameTextField.bottomAnchor, constant: 30),// сверху от техтфилд с отступом 20
            actionButton.heightAnchor.constraint(equalToConstant: 50),//высота 50
            actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),//отступ слева 16
            actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),//отступ справа 16
            //                actionButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 34),//сверху от нижнего края техтфилд отс 34
        ])
        
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? ""
        print("Status set to statusTextChanged: \(self.statusText)")
    }
    
    
    @objc func buttonPressed() {
        if self.statusText == "" {
            self.textView.text = self.defaultStatusText
        } else {
            self.textView.text = self.statusText
        }
        
    }
    
}




