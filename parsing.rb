require 'open-uri'
require 'nokogiri'
require 'csv'

#PARSING CSV
csv_options_urls = { col_sep: ',', headers: :first_row }
filepath_urls = 'test2.csv'
source_urls = []
CSV.foreach(filepath_urls, csv_options_urls) do |row|
  # row[0].scan(/edx/) {|edx| source_urls << edx }
  source_urls << row[0] if row[0].include? 'edx'
end

# SCRAPING
descriptions = []
source_urls.each do |url|
  p url
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)
  doc.search('.content-grouping').each do |element|
    puts element.text.strip
    descriptions << [element.text]
  end
end


#STORING INTO NEW CSV
csv_options_descriptions = {}
filepath_descriptions = 'edx.csv'
CSV.open(filepath_descriptions, 'wb', csv_options_descriptions) do |new_row|
  descriptions.each do |description|
  new_row << description
  end
end

# if row[0].scan(/^http.*youtube.*/)

# descriptions = []
# source_urls.each do |url|
#   p url
#   html_content = open(url).read
#   doc = Nokogiri::HTML(html_content)
#   doc.search('p').each do |element|
#     p element
#     descriptions << [element.text.strip]
#   end
# end
