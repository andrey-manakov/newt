import ContentApi

extension AccountModel: CreateContentRepresentable {

    struct Create: ValidatableContent {
        var name: String
        var amount: Int
    }

    func create(_ content: Create) throws {
        self.name = content.name
        self.amount = content.amount
    }
}
