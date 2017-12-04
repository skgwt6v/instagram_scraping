require 'open-uri'
require 'JSON'


def scrape_facebook(code)
  begin
    video_view_count = []
    html = open("https://www.facebook.com/#{code}").read
    $code = "https://www.facebook.com/" + code
    $text = html.css(".userContent").content
    $date = html.css(".timestampContent").content
    $view = html.css(".fcg").content
    $like = html.css("#js_da").content
  rescue Exception => e
    return nil
  end
end

# p scrape_instagram(ARGV[0])


