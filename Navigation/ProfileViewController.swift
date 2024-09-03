import UIKit

class ProfileViewController: UIViewController {
    
    
    fileprivate let post = VKPost.makePost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero,style: .grouped)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private enum CellReuseID: String {
        case base = "BaseTableViewCell_ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupView()
        addSubviews()
        setupConstraints()
        tuneTableView()
    }
    
    
    private func setupView(){
        view.backgroundColor = .systemBackground
        navigationItem.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func addSubviews(){
        view.addSubview(tableView)
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func tuneTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        let headerView = ProfileHeaderView()
        tableView.setAndLayout(headerView: headerView)
        tableView.estimatedRowHeight = 50
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.base.rawValue)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count // кол-во публ
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.base.rawValue, for: indexPath) as! PostTableViewCell
        
        _ = post[indexPath.row]
//        cell.configure(with: post) //  метод для настройки ячейки
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Обработка выбора ячейки
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
