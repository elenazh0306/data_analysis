require_relative "./models/meeting"

class MeetingRepositories
  def open_csv_committee
    @meetings = []
    csv_file_path = "speakers_committee.csv"
    CSV.foreach(csv_file_path, headers: true, header_converters: :symbol) do |row|
      raw_date = row[:smeetingdate]
      year, month, day = raw_date.split("/")
      western_year = year.to_i + 1911
      date = Date.new(western_year, month.to_i, day.to_i)
      hash = {
        date: date,
        committee: row[:meetingtypename],
        meeting_name: row[:meetingname],
        content: row[:meetingcontent],
        legislator: row[:legislatornamelist]
      }
      meeting = Meeting.new(hash)
      @meetings << meeting
    end
  end

  def count(committee, date)
    counts = Hash.new(0)
    @meetings.each do |meeting|
      if meeting.committee == committee && meeting.date > date
        next if meeting.legislator.nil?
        meeting.legislator.split(";").each do |name|
          counts[name] += 1
        end
      end
    end
    counts
  end

end
