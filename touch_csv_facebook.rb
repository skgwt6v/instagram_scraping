require 'nokogiri'

# URLに簡単にアクセスできるようにするためのライブラリ
require 'open-uri'
# CSV出力をできるようにするためのライブラリ
require 'csv'
# urlリストを取得

require 'JSON'

require './facebook_urls.rb'
require './scrape_facebook.rb'


stores = [["url","本文","日付","View数","Like数"]]

filename = ARGV[0] + '.csv'
countdown = $urls.length

$urls.each do |url|
    scrape_facebook(url)
    array = []
    array.push($code,$text,$date,$view,$like)
    stores.push(array)

    countdown -= 1
    puts('残り' + countdown.to_s + '件')
end

CSV.open(filename, "w") do |csv|
    stores.each do |store|
      csv << store
    end
  puts ('success!')
end