
import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    
    private var statusText: String = ""
    private let defaultStatusText: String = "Enter your status here"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Аbout Me"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        //label.translatesAutoresizingMaskIntoConstraints = false
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
        // imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.textColor = .darkGray
        textView.text = "Enter your status here"
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.isEditable = true
        // textView.translatesAutoresizingMaskIntoConstraints = false
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
        // textField.translatesAutoresizingMaskIntoConstraints = false
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
        //  button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addTarget()
        addConstraint()
        //setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        addTarget()
        addConstraint()
        //setupConstraints()
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
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.safeAreaLayoutGuide)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(27)
            make.height.equalTo(27)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.left.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.width.height.equalTo(100)
        }
        
        textView.snp.makeConstraints { make in
            make.centerX.equalTo(titleLabel).offset(30)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.width.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.6)
            make.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(textView)
            make.top.equalTo(textView.snp.bottom).offset(0)
            make.width.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.6)
            make.height.equalTo(40)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-16)
        }
        
        actionButton.snp.makeConstraints { make in
            make.centerX.equalTo(nameTextField)
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.height.equalTo(50)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-16)
        }
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




