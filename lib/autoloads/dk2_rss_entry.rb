
class Dk2RssEntry
  include Redis::Objects

  attr_accessor :title, :summary, :url, :image_url, :published_at

  def self.fetch
    @rawdata = nil
    LogUtil.info(self.log_filename, 'try fetching rss')
    result = fetch_resource(Setty.dk2_game.rss_feed)
    @rawdata = result[:body]
  end

  def self.newest_entries(quantity = 2)
    @newest_entries ||= begin
      entries = []
      helpers = ApplicationController.helpers
      feed = Feedjira::Feed.parse(self.fetch)
      feed.entries.each do |data|
        next if data.summary.blank?
        entry = self.new
        entry.title = data.title
        if data.summary =~ /<img .* src="(http.*)" class/
          entry.image_url = $1
          #binding.pry
        end
        entry.summary = helpers.strip_tags(data.summary).sub(/^[\s| ]*/, '').sub(/\s$/, '')
        entry.url = data.url
        entry.published_at = data.published.in_time_zone
        entries << entry
        return entries if entries.size >= quantity
      end
      entries
    rescue
      @newest_entries = []
    end
  end

  def self.get_image_file_cached(url)
    result = fetch_resource(url)
    file = result[:body]
    file
  end


  def self.fetch_resource(url)
    result = {:body => nil}
    begin
      uri = URI.parse(url)
      url_host = URI::Generic.build(scheme: uri.scheme, host: uri.host, port: uri.port).to_s

      options = {
        request: {
          timeout: 3,
          open_timeout: 3
        }
      }

      conn = Faraday.new(url_host, options) do |faraday|
        faraday.use FaradayMiddleware::FollowRedirects
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end

      response = conn.get(uri.request_uri) do |req|
        
      end
      LogUtil.info(self.log_filename, response.status)
      LogUtil.info(self.log_filename, response.headers)
      if response.success?
        result[:body] = response.body
      end
    rescue 
      result[:body] = nil
    end
    return result;
  end

  def self.log_filename
    "dk2_game.log"
  end

end