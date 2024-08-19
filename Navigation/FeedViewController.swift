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
        button.setTitle("First post", for: .normal)
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Second post", for: .normal)
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
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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

