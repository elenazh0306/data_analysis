require "active_record"
require_relative "./models/legislator"
require "csv"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/development.sqlite3"
)



p Legislator.count
