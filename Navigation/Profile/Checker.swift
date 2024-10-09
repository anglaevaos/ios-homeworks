
import UIKit

class Checker {

    static let shared = Checker()
    
    private let myLogin: String = "Madara"
    private let myPassword: String = "Uchiha"
    
    private init() {
        
    }
    
    func check(login: String, password: String) -> Bool {
        return login == myLogin && password == myPassword
    }

}
