import ContentApi

extension AccountModel: GetContentRepresentable {

    struct Get: Content {
        let name: String
        let amount: Int
    }

    var getContent: Get {
        .init(name: self.name, amount: self.amount)
    }
}
