

import UIKit

protocol LoginFactory {
    
    func makeLoginInspector() -> LoginInspector
    
}

class defaultLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
