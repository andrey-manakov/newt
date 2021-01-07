//
//  UserMigration_v1_0_0.swift
//  User
//
//  Created by Andrey Manakov on 07.01.2021.
//

import Vapor
import Fluent

struct UserMigration_v1_0_0: Migration {

    func prepare(on db: Database) -> EventLoopFuture<Void> {
        db.eventLoop.flatten([
            db.schema(UserModel.schema)
                .id()
                .field(UserModel.FieldKeys.example, .string, .required)
                .unique(on: UserModel.FieldKeys.example)
                .create(),
        ])
    }

    func revert(on db: Database) -> EventLoopFuture<Void> {
        db.eventLoop.flatten([
            db.schema(UserModel.schema).delete(),
        ])
    }
}
