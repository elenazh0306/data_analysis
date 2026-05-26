require "active_record"
require_relative "./models/legislator"
require_relative "./models/plenary_meeting"
require_relative "./models/committee_meeting"
require "csv"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/development.sqlite3"
)

require_relative './controllers/legislators_controller'
require_relative 'router'
require "csv"


legislator_controller = LegislatorsController.new



router = Router.new(legislator_controller)

# Start the app
router.run
