require "json"
require "rest-client"


# url = "https://data.ly.gov.tw/odw/openDatasetJson.action?id=370&selectTerm=all&page=1"
# site_serialized = URI.parse(url).read
# site = JSON.parse(site_serialized)
# to_use = site["jsonList"]


# to_use.each do |n|
#   string = n["voteIssue"].to_s
#   puts string if string.include?("國")
# end

url = "https://data.ly.gov.tw/odw/openDatasetJson.action?id=20&selectTerm=all&page=1"
site_serialized = RestClient.get(url)
site = JSON.parse(site_serialized)
to_use = site["jsonList"]


# to_use.each do |n|
#   string = n["billProposer"].to_s
#   puts string
# end

to_use.each do |item|
  Post.create(
    billProposer: item["billProposer"],
    billName: item["billName"],
    billCosignatory: item["billCosignatory"]
  )
end
