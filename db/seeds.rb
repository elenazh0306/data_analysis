require "csv"
require "rest-client"
require_relative "../app/models/plenary_meeting"
require_relative "../app/models/legislator"
require_relative "../app/models/committee_meeting"
require "active_record"


# legislator db
@legislators = []
csv_file_path_plenary = "speakers_plenary.csv"
CSV.foreach(csv_file_path_plenary, headers: true, header_converters: :symbol) do |row|
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

#plenary meetings

CSV.foreach(csv_file_path_plenary, headers: true, header_converters: :symbol) do |row|
  raw_date = row[:smeetingdate]
  year, month, day = raw_date.split("/")
  western_year = year.to_i + 1911
  date = Date.new(western_year, month.to_i, day.to_i)
  if date > Date.new(2025, 1, 1)
    # берет ячейку с политиками, делит ее и для каждого создает инстанс
    if row[:legislatornamelist].nil?
      PlenaryMeeting.create(name: row[:meetingname], content: row[:meetingcontent], date: date)
    else
      legislators_clean = row[:legislatornamelist].split(/[,、，;]/).map(&:strip)
      legislators_clean.each do |legislator|
        add_legislator = Legislator.find_by(name: legislator)
        meeting = PlenaryMeeting.create(name: row[:meetingname], content: row[:meetingcontent], date: date)
        meeting.legislator = add_legislator
        meeting.save!
      end
    end
  end
end

# committee meeting
csv_file_path_committee = "speakers_committee.csv"
CSV.foreach(csv_file_path_committee, headers: true, header_converters: :symbol) do |row|
  raw_date = row[:smeetingdate]
  year, month, day = raw_date.split("/")
  western_year = year.to_i + 1911
  date = Date.new(western_year, month.to_i, day.to_i)
  if date > Date.new(2025, 1, 1)
    # берет ячейку с политиками, делит ее и для каждого создает инстанс
    if row[:legislatornamelist].nil?
      CommitteeMeeting.create(name: row[:meetingname], content: row[:meetingcontent], date: date)
    else
      legislators_clean = row[:legislatornamelist].split(/[,、，;]/).map(&:strip)
      legislators_clean.each do |legislator|
        meeting = CommitteeMeeting.create(name: row[:meetingname], committee: row[:meetingtypename], content: row[:meetingcontent], date: date)
        add_legislator = Legislator.find_by(name: legislator)
        if add_legislator.nil?
          new_legislator = Legislator.create(name: legislator)
          meeting.legislator = new_legislator
        else
          meeting.legislator = add_legislator
        end
        meeting.save!
      end
    end
  end
end
