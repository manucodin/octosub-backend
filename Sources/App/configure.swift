import Fluent
import FluentMongoDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    let dataBaseURL = Environment.get("MONGO_DB_HOST") ?? ""
    let dataBaseName = Environment.get("PROYECT_NAME") ?? ""
    
    try app.databases.use(.mongo(
        connectionString: Environment.get("DATABASE_URL") ?? "\(dataBaseURL)/\(dataBaseName)"
    ), as: .mongo)

    app.migrations.add(CreateTodo())

    // register routes
    
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    try routes(app)
}
