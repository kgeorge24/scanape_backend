require 'rest-client'
require 'JSON'

response = RestClient.post("https://api.upcitemdb.com/prod/trial/lookup",
  { 'upc' => '041331124027' }.to_json,
  {
    :content_type => :json,
    :accept => :json,
  }
)
puts "status: #{response.code}"
puts "----headers----"
# puts response.headers
puts "----body----"
json_response = JSON.parse(response.body)
# puts json_response["items"][0]["images"][0]
# puts json_response

title = []
        
title.push(json_response["items"][0]["title"].split("-"))
title[0][0].split(",")
puts title[0][0]
# puts json_response["items"][0]["title"]
# puts json_response["items"][0]["description"]


