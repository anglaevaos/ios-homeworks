import UIKit

class FeedViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical // Вертикальное расположение
        stackView.spacing = 10 // Задаем spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("First button", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Second button", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Feed"
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        button1.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        button2.addTarget(self, action: #selector(openPost), for: .touchUpInside)
    }
    
    
    @objc private func openPost(sender: UIButton) {
        let post = Post(title: sender.currentTitle ?? "New post") // Получаем заголовок из кнопки
        let postViewController = PostViewController(post: post)
        
        navigationController?.pushViewController(postViewController, animated: true)
    }
}

