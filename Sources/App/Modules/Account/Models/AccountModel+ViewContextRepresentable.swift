
extension AccountModel: ViewContextRepresentable {

    struct ViewContext: Encodable {
        var id: String
        var name: String
        var amount: Int

        init(model: AccountModel) {
            self.id = model.id!.uuidString
            self.name = model.name
            self.amount = model.amount
        }
    }

    var viewIdentifier: String { self.id!.uuidString }
    var viewContext: ViewContext { .init(model: self) }
}
