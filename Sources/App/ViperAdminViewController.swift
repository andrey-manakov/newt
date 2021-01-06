protocol ViperAdminViewController: AdminViewController where Model: ViperModel  {
    associatedtype Module: ViperModule
}

extension ViperAdminViewController {
    var listView: String { "\(Model.Module.name)/list" }
    var editView: String { "\(Model.Module.name)/edit" }
}
