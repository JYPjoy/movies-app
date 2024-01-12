//
//  File.swift
//  
//
//  Created by Joy on 1/12/24.
//

import Foundation
import Fluent

struct CreateMoviesTableMigration: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        // create movies table
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    // this will run when you undo migration
    func revert(on database: FluentKit.Database) async throws {
        // delete movies table
        try await database.schema("movies")
            .delete()
    }
}
