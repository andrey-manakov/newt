//
//  AccountModule.swift
//  Account
//
//  Created by Andrey Manakov on 05.01.2021.
//

import Vapor
import Fluent
//import ViperKit

final class AccountModule: ViperModule {

    static var name: String = "account"

    var router: ViperRouter? { AccountRouter() }

    var migrations: [Migration] {
        [
            CreateAccount(),
        ]
    }
}
