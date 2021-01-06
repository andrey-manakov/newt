import ContentApi
extension AccountModel: PatchContentRepresentable {
    struct Patch: ValidatableContent {
        var name: String?
        var amount: Int?
    }

    func patch(_ content: Patch) throws {
        self.name = content.name ?? self.name
        self.amount = content.amount ?? self.amount
    }
}
