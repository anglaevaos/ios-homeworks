
import UIKit

class LoginInspector: LoginViewControllerDelegate {
    
    func check(login: String, password: String) -> Bool {
        return Checker.shared.check(login: "mylogin", password: "mypassword")
    }
}

   

