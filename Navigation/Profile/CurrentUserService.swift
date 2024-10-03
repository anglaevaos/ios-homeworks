

import UIKit

class CurrentUserService: UserService {
    
    public var currentUser: User?
    
    init(currentUser: User? = nil) {
        self.currentUser = currentUser
    }
    
    func getUser (by login: String) -> User? {
        if self.currentUser?.userLogin == login {
            return self.currentUser
        }
        
        return nil
    }
}
