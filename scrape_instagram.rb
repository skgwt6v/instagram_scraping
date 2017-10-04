require 'open-uri'
require 'JSON'


def scrape_instagram(code)
  begin
    video_view_count = []
    instagram_source = open("https://www.instagram.com/p/#{code}").read
    content = JSON.parse(instagram_source.split("window._sharedData = ")[1].split(";</script>")[0])
    $code = code
    $text = content['entry_data']['PostPage'][0]['graphql']['shortcode_media']['edge_media_to_caption']['edges'][0]['node']['text']
    $date = Time.at(content['entry_data']['PostPage'][0]['graphql']['shortcode_media']['taken_at_timestamp'])
    $view = content['entry_data']['PostPage'][0]['graphql']['shortcode_media']['video_view_count']
    $like = content['entry_data']['PostPage'][0]['graphql']['shortcode_media']['edge_media_preview_like']['count']
  rescue Exception => e
    return nil
  end
end

# p scrape_instagram(ARGV[0])


