require "csv"
require_relative "./models/meeting"
require "json"
require "open-uri"

# csv_file_path = "https://data.ly.gov.tw/odw/usageFile.action?id=223&type=CSV&fname=223_CSV.csv"
# CSV.foreach(csv_file_path) do |row|
#   meeting = Meeting.new(row[0], row[2], row[4], row [5], row[6])
#   @meetings << meeting
# end

@meetings = []

url = "https://data.ly.gov.tw/odw/openDatasetJson.action?id=223&selectTerm=all&page=1"
site_serialized = URI.parse(url).read
site = JSON.parse(site_serialized)
to_use = site["jsonList"]
to_use.each do |instance|
  hash = {date: instance["smeetingDate"], committee: instance["meetingTypeName"], meeting_name: instance["meetingName"], content: instance["meetingContent"], legislator: instance["legislatorNameList"]}
  meeting = Meeting.new(hash)
  @meetings << meeting
end



counts = Hash.new(0)

@meetings.each do |meeting|
  if meeting.committee == "外交及國防委員會"

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
