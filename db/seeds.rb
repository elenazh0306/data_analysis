require "json"
require "rest-client"

# # TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
# filepath = 'https://hacker-news.firebaseio.com/v0/topstories.json'
# serialized_posts = RestClient.get(filepath)
# posts = JSON.parse(serialized_posts)


# 10.times do |i|
#   filepath = "https://hacker-news.firebaseio.com/v0/item/#{posts[i]}.json"
#   serialized_post = RestClient.get(filepath)
#   post = JSON.parse(serialized_post)
#   Post.create(title: post[:title], url: post[:url], votes: post[:score])
# end
# require "json"
# require "open-uri"

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
