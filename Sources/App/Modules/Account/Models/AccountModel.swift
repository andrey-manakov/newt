//
//  AccountModel.swift
//  Account
//
//  Created by Andrey Manakov on 05.01.2021.
//

import Vapor
import Fluent
//import ViperKit

final class AccountModel: ViperModel {
    typealias Module = AccountModule

    static let name = "accounts"

    struct FieldKeys {
        static var name: FieldKey { "name" }
        static var amount: FieldKey { "amount" }
    }

    // MARK: - fields

    @ID() var id: UUID?
    @Field(key: FieldKeys.name) var name: String
    @Field(key: FieldKeys.amount) var amount: Int

    init() { }

    init(id: AccountModel.IDValue? = nil,
         name: String,
         amount: Int)
    {
        self.id = id
        self.name = name
        self.amount = amount
    }
}
