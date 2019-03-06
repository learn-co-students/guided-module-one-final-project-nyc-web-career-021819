require 'rest-client'
require 'json'
require 'pry'


# *************** SEND REQUEST TO API TO PULL BEER DATA (CAN SPECIFY NUMBER OF PAGES TO PARSE) **********************
def get_all_beers
  counter = 1
  response_array = []
  while counter < 2
    response_string = RestClient.get('https://sandbox-api.brewerydb.com/v2/beers/?p='"#{counter}"'&key=67caa2c52c8169eeea83e4c37e6d9b14')
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
# *************** SIMPLER DATA (CAN ADD FIELDS AS REQUIRED)**********************
  test_beer_data = []
  beer_data.each do |beer_info|
    hash = Hash.new
    if beer_info["name"] && beer_info["abv"] && beer_info["foodPairings"]
      hash[:name] = beer_info["name"]
      hash[:abv] = beer_info["abv"]
      hash[:foodPairings] = beer_info["foodPairings"]
      test_beer_data << hash
    end
end

# *************** SEND REQUEST TO API TO PULL STYLES DATA  **********************
def get_all_styles
  counter = 1
  response_array = []
  while counter < 2
    response_string = RestClient.get('https://sandbox-api.brewerydb.com/v2/styles/?p='"#{counter}"'&key=67caa2c52c8169eeea83e4c37e6d9b14')
    response_hash = JSON.parse(response_string)
    response_array << response_hash["data"]
    counter += 1
    # binding.pry
  end
  response_array.flatten
end

# *************** SORT STYLE JSON DATA IN ARRAY FORM - FOR DB SEED DATA **********************
# *************** FULL DATA (ID HAS TO BE SET, AS IT WILL BE THE RELATED TO THE FOREIGN ID IN THE BEER TABLE) **********************
style_data = get_all_styles

style_seed_data = []
style_data.each do |style_info|
  hash = Hash.new
    hash[:id] = style_info["id"]
    hash[:name] = style_info["name"]
    hash[:shortName] = style_info["shortName"]
    style_seed_data << hash
end

# *************** SEND REQUEST TO API TO PULL GLASSWARE DATA  **********************

def get_all_glassware
  counter = 1
  response_array = []
  while counter < 2
    response_string = RestClient.get('https://sandbox-api.brewerydb.com/v2/glassware/?p='"#{counter}"'&key=67caa2c52c8169eeea83e4c37e6d9b14')
    response_hash = JSON.parse(response_string)
    response_array << response_hash["data"]
    counter += 1
    # binding.pry
  end
  response_array.flatten
end

# *************** SORT GLASSWARE JSON DATA IN ARRAY FORM - FOR DB SEED DATA **********************
# *************** FULL DATA (ID HAS TO BE SET, AS IT WILL BE THE RELATED TO THE FOREIGN ID IN THE BEER TABLE) **********************

glassware_data = get_all_glassware

glassware_seed_data = []
glassware_data.each do |glassware_info|
  hash = Hash.new
    hash[:id] = glassware_info["id"]
    hash[:name] = glassware_info["name"]
    glassware_seed_data << hash
end

binding.pry
"x"
