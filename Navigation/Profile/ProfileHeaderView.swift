
import UIKit

class ProfileHeaderView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Аbout Me"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")
        imageView.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = (UIColor(white: 242.0/255.0, alpha: 1.0)).cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.textColor = .darkGray
        textView.text = "Enter your status here"
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.isEditable = true
        return textView
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
        return button
    }()
    
   
    private func setupView() {
        self.backgroundColor = UIColor.lightGray
        addSubview(titleLabel)
        addSubview(profileImageView)
        addSubview(textView)
        addSubview(actionButton)
        

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor), // расположение в центре
                    titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27), // закрепление сверху
                    titleLabel.heightAnchor.constraint(equalToConstant: 27) // отступ
                ])

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                    profileImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),// расположение на экране - слева
                    profileImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16), //отступ сверху от safeArea
                    profileImageView.widthAnchor.constraint(equalToConstant: 100), //ширина
                    profileImageView.heightAnchor.constraint(equalToConstant: 100),//высота
                    profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16) // отступ
                ])

        textView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    textView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor, constant: 30),
                    textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                    textView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
                    textView.heightAnchor.constraint(equalToConstant: 100),
//                  textView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
                ])

        actionButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    actionButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    actionButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
                    actionButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 34),
//                  actionButton.widthAnchor.constraint(equalToConstant: 500),
                    actionButton.heightAnchor.constraint(equalToConstant: 50),
                    actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                    actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16) 
                ])


        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            }

            @objc func buttonPressed() {
                print(textView.text ?? "No text available")
            }

            override func layoutSubviews() {
                super.layoutSubviews()

            }
        }



       
