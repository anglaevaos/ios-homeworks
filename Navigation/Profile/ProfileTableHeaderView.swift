
import UIKit

class ProfileTableHeaderView: UIView {
    
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .lightGray
        
        titleLabel.text = "Профиль"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // количество секций
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50 // Высота заголовка
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileTableHeaderView()
    }
}



















//    let profileHeaderView = ProfileHeaderView()
//    private let profileButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Profile button", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        button.backgroundColor = .systemGray3
//        button.setTitleColor(.white, for: .normal)
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.cornerRadius = 4
//        button.layer.shadowOpacity = 0.7
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Profile"
//        setupHeaderView()
//        addView()
//        addConstraints()
//    }
//
//    private func setupHeaderView() {
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    private func addView(){
//        view.addSubview(profileHeaderView)
//        view.addSubview(profileButton)
//    }
//
//    private func addConstraints(){
//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
//            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            profileButton.widthAnchor.constraint(equalToConstant: 100),
//            profileButton.heightAnchor.constraint(equalToConstant: 40),
//            profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            profileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
//        ])
//    }


