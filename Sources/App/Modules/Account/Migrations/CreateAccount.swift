//
//  AccountMigration_v1_0_0.swift
//  Account
//
//  Created by Andrey Manakov on 05.01.2021.
//

import Vapor
import Fluent

struct CreateAccount: Migration {

    func prepare(on db: Database) -> EventLoopFuture<Void> {
        db.eventLoop.flatten([
            db.schema(AccountModel.schema)
                .id()
                .field(AccountModel.FieldKeys.name, .string, .required)
                .unique(on: AccountModel.FieldKeys.name)
                .field(AccountModel.FieldKeys.amount, .int, .required)
                .create(),
        ])
    }

    func revert(on db: Database) -> EventLoopFuture<Void> {
        db.eventLoop.flatten([
            db.schema(AccountModel.schema).delete(),
        ])
    }
}
