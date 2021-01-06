import ContentApi

extension AccountModel: ListContentRepresentable {

    struct ListItem: Content {
        let id: UUID?
        let name: String
        let amount: Int
    }

    var listContent: ListItem {
        .init(id: self.id, name: self.name, amount: self.amount)
    }
}
