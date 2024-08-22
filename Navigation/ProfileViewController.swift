

import UIKit


class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
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
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

