

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
let alertButton = UIButton(type: .system)
                  alertButton.setTitle("Show Alert", for: .normal)
                  alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)

                  alertButton.translatesAutoresizingMaskIntoConstraints = false
                  view.addSubview(alertButton)

                  NSLayoutConstraint.activate([
                      alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                      alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                  ])
              }

            @objc func showAlert() {
                  
                  let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
                  let firstAction = UIAlertAction(title: "First action", style: .default) { _ in
                      print("First action selected")
                  }

                  
                  let secondAction = UIAlertAction(title: "Second action", style: .default) { _ in
                      print("Second action selected")
                  }

                 
                  alertController.addAction(firstAction)
                  alertController.addAction(secondAction)

                  
                  present(alertController, animated: true, completion: nil)
              }
}

