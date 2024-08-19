import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Feed"
        
        let postButton = UIButton(type: .system)
        postButton.setTitle("Post", for: .normal)
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postButton)
        
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    @objc func showPost() {
        let post = Post(title: "New post")
        let postViewController = PostViewController(post: post)
        
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
