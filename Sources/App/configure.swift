import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    app.databases.use(.sqlite(.memory), as: .sqlite)
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.routes.defaultMaxBodySize = "10mb"

//    app.fileStorages.use(.awsS3(key: Environment.awsKey,
//                                    secret: Environment.awsSecret,
//                                    bucket: Environment.fsName,
//                                    region: .init(rawValue: Environment.fsRegion)), as: .awsS3)
//    app.fileStorages.use(.local(publicUrl: "http://localhost:8080",
//                                publicPath: app.directory.publicDirectory,
//                                workDirectory: "assets"), as: .local)

    app.views.use(.leaf)
    if !app.environment.isRelease {
        app.leaf.cache.isEnabled = false
        app.leaf.useViperViews()
    }

    app.sessions.use(.fluent)
    app.migrations.add(SessionRecord.migration)
    app.middleware.use(app.sessions.middleware)

    let modules: [ViperModule] = [
        AccountModule(),
//        UserModule(),
//        FrontendModule(),
//        AdminModule(),
//        BlogModule(),
    ]

    app.get("routes") { _ -> String in
        app.routes.all.description
    }

//    ExampleApiController().setupRoutes(routes: app.routes, on: "example")

//    let controller = ExampleController()
//    controller.setupRoutes(routes: app.routes, on: "examples")

    try app.viper.use(modules)
    try app.autoRevert().wait()
    try app.autoMigrate().wait()

}
