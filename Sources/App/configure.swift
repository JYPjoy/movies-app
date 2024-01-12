import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.databases.use(.postgres(hostname:"batyr.db.elephantsql.com", username: "hefiwtvx", password: "kG4RKKFQME2LVaIbAOkMFUFDpvfHr3bC", database: "hefiwtvx"), as: .psql)
    
    // register migration
    app.migrations.add(CreateMoviesTableMigration())
    
    // register routes
    try routes(app)
}
