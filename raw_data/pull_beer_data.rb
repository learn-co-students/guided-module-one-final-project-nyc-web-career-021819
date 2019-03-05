require 'rest-client'
require 'json'
require 'pry'


# *************** SEND REQUEST TO API TO PULL BEER DATA (CAN SPECIFY NUMBER OF PAGES TO PARSE) **********************
def get_all_beers
  counter = 24
  response_array = []
  while counter < 100
    response_string = RestClient.get('https://api.brewerydb.com/v2/beers/?p='"#{counter}"'&key=e8b4daa262ed98aba464e1b231c0c79d')
    response_hash = JSON.parse(response_string)
    response_array << response_hash["data"]
    counter += 1
    # binding.pry
  end
  response_array.flatten
end

# *************** SORT JSON DATA IN ARRAY FORM - FOR DB SEED DATA **********************
# *************** FULL DATA (CAN ADD FIELDS AS REQUIRED) **********************
beer_data = get_all_beers

full_beer_data = []
beer_data.each do |beer_info|
  hash = Hash.new
  if beer_info["name"] && beer_info["abv"] && beer_info["glass"] && beer_info["style"] && beer_info["foodPairings"]
    hash[:name] = beer_info["name"]
    hash[:abv] = beer_info["abv"]
    hash[:foodPairings] = beer_info["foodPairings"]
    hash[:glasswareId] = beer_info["glass"]["id"]
    hash[:styleId] = beer_info["style"]["id"]
    hash[:description] = beer_info["style"]["description"]
    full_beer_data << hash
  end
end

puts full_beer_data
