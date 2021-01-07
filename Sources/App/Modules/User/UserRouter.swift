//
//  UserRouter.swift
//  User
//
//  Created by Andrey Manakov on 07.01.2021.
//

import Vapor
import ViperKit

final class UserRouter: ViperRouter {

    let controller = UserFrontendController()

    func boot(routes: RoutesBuilder, app: Application) throws {

        routes.get("example", use: self.controller.exampleView)
    }
}
