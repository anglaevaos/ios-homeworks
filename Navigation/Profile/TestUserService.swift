//
//  TestUserService.swift
//  Navigation
//
//  Created by Oksana Anglaeva on 03.10.2024.
//

import UIKit

class TestUserService: UserService {

    public var testUser = User(userLogin: "test", userFullname: "test", userStatus: "test", userAvatar: UIImage(named: "18"))
    
    func getUser(by login: String) -> User? {
        if self.testUser.userLogin == login {
            return self.testUser
        }
        
        return nil
    }
  
}
