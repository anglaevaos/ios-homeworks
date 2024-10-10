

import UIKit
//1 создаем протокол
protocol LoginViewControllerDelegate: AnyObject {

    func check(login: String, password: String) -> Bool 

}
