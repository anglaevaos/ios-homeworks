

import UIKit


class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    private let profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Profile button", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .systemGray3
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.cornerRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
        setupHeaderView()
        addView()
        addConstraints()
    }
    
    private func setupHeaderView() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addView(){
        view.addSubview(profileHeaderView)
        view.addSubview(profileButton)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            profileButton.widthAnchor.constraint(equalToConstant: 100),
            profileButton.heightAnchor.constraint(equalToConstant: 40),
            profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
}

