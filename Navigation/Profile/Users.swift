//
//  Users.swift
//  Navigation
//
//  Created by Oksana Anglaeva on 02.10.2024.
//

import UIKit

class User {

        let userLogin: String
        let userFullname: String
        let userStatus: String
        let userAvatar: UIImage?

        init(userLogin: String, userFullname: String, userStatus: String, userAvatar: UIImage?) {
            self.userLogin = userLogin
            self.userFullname = userFullname
            self.userStatus = userStatus
            self.userAvatar = userAvatar   
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    protocol UserService {
        func getUser (by login: String) -> User?

}

