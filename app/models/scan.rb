require 'rest_client'
# require 'JSON'

class Scan < ApplicationRecord
    belongs_to :user
    
    
    def getInfo
        response = RestClient.post("https://api.upcitemdb.com/prod/trial/lookup",
            { 'upc' => "#{self.barcode}" }.to_json,
            {
                :content_type => :json,
                :accept => :json,
            }
           )
        # puts "status: #{response.code}"
        # puts "----headers----"
        # puts response.headers
        # puts "----body----"
        json_response = JSON.parse(response.body)
        # puts json_response
        # puts json_response["items"][0]["title"]
        # puts json_response["items"][0]["description"]
        
        title = []
        clean_response = json_response["items"][0]["title"].split("-")
        cleanest_response = clean_response[0].split(",")
        title.push(cleanest_response)
        title.push(json_response["items"][0]["images"][0])

        @ingredient = Ingredient.create(title: title[0][0], picture: title[1])
        @user_ingredient = UserIngredient.create(user_id: "#{self.user_id}", ingredient_id: @ingredient.id)
        return @ingredient
        # return "Success"
    end
    
end
