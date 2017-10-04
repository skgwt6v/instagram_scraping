require 'nokogiri'

# URLに簡単にアクセスできるようにするためのライブラリ
require 'open-uri'
# CSV出力をできるようにするためのライブラリ
require 'csv'
# urlリストを取得

require 'JSON'

require './instagram_urls.rb'
require './scrape_instagram.rb'

codes = []
textes = []
dates = []
views = []
likes = []
filename = ARGV[0] + '.csv'

$urls.each do |url|
    scrape_instagram(url)
    codes.push($code)
    textes.push($text)
    dates.push($date)
    views.push($view)
    likes.push($like)

    # count =-
    # puts ("残り" + count + "件"）
end

CSV.open(filename, "w") do |csv|
  csv << codes
  csv << textes
  csv << dates
  csv << views
  csv << likes
  puts ('success!')
end