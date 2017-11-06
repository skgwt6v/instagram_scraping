require 'nokogiri'

# URLに簡単にアクセスできるようにするためのライブラリ
require 'open-uri'
# CSV出力をできるようにするためのライブラリ
require 'csv'
# urlリストを取得

require 'JSON'

require './instagram_urls.rb'
require './scrape_instagram.rb'

codes = ["url"]
textes = ["本文"]
dates = ["日付"]
views = ["View数"]
likes = ["Like数"]
filename = ARGV[0] + '.csv'
countdown = $urls.length

$urls.each do |url|
    scrape_instagram(url)
    codes.push($code)
    textes.push($text)
    dates.push($date)
    views.push($view)
    likes.push($like)

    countdown -= 1
    puts('残り' + countdown.to_s + '件')
end

CSV.open(filename, "w") do |csv|
  csv << codes
  csv << textes
  csv << dates
  csv << views
  csv << likes
  puts ('success!')
end