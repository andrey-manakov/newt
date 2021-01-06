import ContentApi
extension AccountModel: UpdateContentRepresentable {

    struct Update: ValidatableContent {
        var name: String
        var amount: Int
    }

    func update(_ content: Update) throws {
        self.name = content.name
        self.amount = content.amount
    }
}
