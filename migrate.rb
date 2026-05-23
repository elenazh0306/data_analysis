require "active_record"
require "sqlite3"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/development.sqlite3"
)

ActiveRecord::Migrator.migrations_paths = ["db/migrate"]

schema_migration = ActiveRecord::SchemaMigration.new(
  ActiveRecord::Base.connection_pool
)

internal_metadata = ActiveRecord::InternalMetadata.new(
  ActiveRecord::Base.connection_pool
)

migration_context = ActiveRecord::MigrationContext.new(
  ActiveRecord::Migrator.migrations_paths,
  schema_migration,
  internal_metadata
)

migration_context.migrate
