require 'json'
require 'open-uri'
require 'csv'

url = 'https://www.googleapis.com/youtube/v3/videoCategories?part=%22%22&key=AIzaSyBrR2_pcSgzveYO-XsaiJbfARpdWcwb7fQ'
user_serialized = open(url).read
user = JSON.parse(user_serialized)


# csv_options_descriptions = {}
# filepath_descriptions = 'edx.csv'
# CSV.open(filepath_descriptions, 'wb', csv_options_descriptions) do |new_row|
#   descriptions.each do |description|
#   new_row << description
#   end
# end
