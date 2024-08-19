

import UIKit


class ProfileViewController: UIViewController {
  
    
    let profileHeaderView = ProfileHeaderView()
    
    private var headerView: ProfileHeaderView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
        setupHeaderView()
        
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func setupHeaderView() {
        headerView = ProfileHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.backgroundColor = .lightGray
        view.addSubview(headerView)


        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillLayoutSubviews() {
//            super.viewWillLayoutSubviews()
//            headerView.frame = view.bounds

    }
    
    
}

