
import UIKit


struct Post {
    let title: String
}

class PostViewController: UIViewController {
    
    var post: Post
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = post.title

        
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Info",
            style: .plain,
            target: self,
            action: #selector(addInfoMessage))
    }
    
    @objc func addInfoMessage (){
        let infoViewController = InfoViewController()
        
        infoViewController.modalTransitionStyle = .coverVertical
        infoViewController.modalPresentationStyle = .formSheet
        present(infoViewController, animated: true)
        
//        navigationController?.pushViewController(infoViewController, animated: true)
        
    }

}

