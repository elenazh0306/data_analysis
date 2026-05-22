require "csv"
require_relative "./models/meeting"
require "json"
require "open-uri"
require "date"

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


# url = "https://data.ly.gov.tw/odw/openDatasetJson.action?id=223&selectTerm=all&page=1"
# site_serialized = URI.parse(url).read
# site = JSON.parse(site_serialized)
# to_use = site["jsonList"]


# to_use.each do |instance|
#   hash = {date: instance["smeetingDate"], committee: instance["meetingTypeName"], meeting_name: instance["meetingName"], content: instance["meetingContent"], legislator: instance["legislatorNameList"]}
#   meeting = Meeting.new(hash)
#   @meetings << meeting
# end



counts = Hash.new(0)

@meetings.each do |meeting|
  if meeting.committee == "外交及國防委員會" && meeting.date > Date.new(2025, 1, 1)

    next if meeting.legislator.nil?

    meeting.legislator.split(";").each do |name|
      counts[name] += 1
    end
  end
end
p counts


# url = "https://data.ly.gov.tw/odw/openDatasetJson.action?id=370&selectTerm=all&page=1"
# site_serialized = URI.parse(url).read
# site = JSON.parse(site_serialized)
# to_use = site["jsonList"]

# to_use.each do |n|
#   string = n["voteIssue"].to_s
#   puts string if string.include?("國")
# end

# url = "https://data.ly.gov.tw/odw/openDatasetJson.action?id=20&selectTerm=all&page=1"
# site_serialized = RestClient.get(url)
# site = JSON.parse(site_serialized)
# to_use = site["jsonList"]


# # to_use.each do |n|
# #   string = n["billProposer"].to_s
# #   puts string
# # end

# to_use.each do |item|
#   Post.create(
#     billProposer: item["billProposer"],
#     billName: item["billName"],
#     billCosignatory: item["billCosignatory"]
#   )
# end
