//
//  UserFrontendController.swift
//  User
//
//  Created by Andrey Manakov on 07.01.2021.
//

import Vapor
import Fluent

final class UserFrontendController {

    func exampleView(req: Request) throws -> EventLoopFuture<View> {
        struct Context: Encodable {
            let foo: String
        }
        let context = Context(foo: "This is just an example")
        return req.view.render("User/Frontend/Example", context)
    }

}
