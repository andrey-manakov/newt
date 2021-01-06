//
//  AccountRouter.swift
//  Account
//
//  Created by Andrey Manakov on 05.01.2021.
//

import Vapor
//import ViperKit

final class AccountRouter: ViperRouter {

    let controller = AccountFrontendController()
    let apiController = AccountApiController()
    let webController = AccountWebController()

    func boot(routes: RoutesBuilder, app: Application) throws {
        apiController.setupRoutes(routes: routes.grouped("api"), on: "accounts")
        webController.setupRoutes(routes: routes, on: "accounts")
    }
}
