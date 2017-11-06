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
countdown = $urls.length

$urls.each_with_index do |url,i|
    scrape_instagram(url)
    codes.push($code)
    textes.push($text)
    dates.push($date)
    views.push($view)
    likes.push($like)
    puts('残り' + countdown.to_s + '件')
    countdown -= 1
end

CSV.open(filename, "w") do |csv|
  csv << codes
  csv << textes
  csv << dates
  csv << views
  csv << likes
  puts ('success!')
end