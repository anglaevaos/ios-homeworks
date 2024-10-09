
import UIKit

class Checker {

    static let shared = Checker()
    
    private let myLogin: String = "mylogin"
    private let myPassword: String = "mypassword"
    
    private init() {
        
    }
    
    func check(login: String, password: String) -> Bool {
        return login == myLogin && password == myPassword
    }

}
