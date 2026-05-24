require "csv"
require_relative "./models/meeting"
require "json"
require "open-uri"
require "date"


# counts = Hash.new(0)
# @meetings.each do |name|
#   if meeting.committee == committee && meeting.date > date
#     next if meeting.legislator.nil?
#     meeting.legislator.split(";").each do |name|
#       counts[name] += 1
#     end
#   end
# end


# from planery meetings - SAVED TO DB DO NOT EXECUTE
@legislators = []
csv_file_path = "speakers_planery.csv"
CSV.foreach(csv_file_path, headers: true, header_converters: :symbol) do |row|
  raw_date = row[:smeetingdate]
  year, month, day = raw_date.split("/")
  western_year = year.to_i + 1911
  date = Date.new(western_year, month.to_i, day.to_i)
  if date > Date.new(2025, 1, 1)
    @legislators << row[:legislatornamelist]
  end
end

legislators_clean = @legislators.flat_map do |name|
  name.split(/[,、，;]/).map(&:strip)
end

legislators_clean.uniq.each do |name|
  new_legislator = Legislator.new(name: name)
  new_legislator.save!

end
