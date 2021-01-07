//
//  UserModel.swift
//  User
//
//  Created by Andrey Manakov on 07.01.2021.
//

import Vapor
import Fluent
import ViperKit

final class UserModel: ViperModel {
    typealias Module = UserModule

    static let name = "examples"

    struct FieldKeys {
        static var example: FieldKey { "example" }
    }

    // MARK: - fields

    @ID() var id: UUID?
    @Field(key: FieldKeys.example) var example: String

    init() { }

    init(id: UserModel.IDValue? = nil,
         example: String)
    {
        self.id = id
        self.example = example
    }
}
