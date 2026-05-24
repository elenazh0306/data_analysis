require "active_record"
require_relative "./models/legislator"
require_relative "./models/plenary_meeting"
require_relative "./models/committee_meeting"
require "csv"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/development.sqlite3"
)



wang = Legislator.find_by(name: "王鴻薇")
p wang.name
puts "Plenary meetings"
wang.plenary_meetings.each do |meeting|
  p meeting.name
end
puts "Committee meetings"
wang.committee_meetings.each do |meeting|
  p meeting.committee
  p meeting.name

end
