//
//  UserModule.swift
//  User
//
//  Created by Andrey Manakov on 07.01.2021.
//

import Vapor
import Fluent
import ViperKit

final class UserModule: ViperModule {

    static var name: String = "example"

    var router: ViperRouter? { UserRouter() }

    var migrations: [Migration] {
        [
            UserMigration_v1_0_0(),
        ]
    }
}
