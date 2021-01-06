import Vapor
final class AccountEditForm: Form {

    struct Input: Decodable {
        var id: String
        var name: String
        var amount: String
    }

    var id: String? = nil
    var name = BasicFormField()
    var amount = BasicFormField()

    init() {}

    init(req: Request) throws {
        let context = try req.content.decode(Input.self)
        if !context.id.isEmpty {
            self.id = context.id
        }

        self.name.value = context.name
        self.amount.value = context.amount
    }

    func write(to model: AccountModel) {
        model.name = self.name.value
        model.amount = Int(self.amount.value)!
    }

    func read(from model: AccountModel )  {
        self.id = model.id!.uuidString
        self.name.value = model.name
        self.amount.value = String(model.amount)
    }

    func validate(req: Request) -> EventLoopFuture<Bool> {
        var valid = true
        if Int(self.amount.value) == nil {
            self.amount.error = "Bar is not an integer"
            valid = false
        }
        return req.eventLoop.future(valid)
    }
}
