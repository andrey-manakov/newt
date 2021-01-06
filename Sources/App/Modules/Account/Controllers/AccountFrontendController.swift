//
//  AccountFrontendController.swift
//  Account
//
//  Created by Andrey Manakov on 05.01.2021.
//

import Vapor
import Fluent

final class AccountFrontendController {

    func exampleView(req: Request) throws -> EventLoopFuture<View> {
        struct Context: Encodable {
            let foo: String
        }
        let context = Context(foo: "This is just an example")
        return req.view.render("Account/Frontend/Example", context)
    }

}
