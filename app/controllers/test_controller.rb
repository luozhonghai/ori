class TestController < ApplicationController
  def index
    if request.xhr?
      #render body: "{\"a\": \"b\"}"
      render json: {a: "b"}
    end

    #HardWorker.perform_async('bob', 5)
  end

  def rss
    @dk2_game_entries = Dk2RssEntry.newest_entries
  end

  def get_dk2_game_image
    image = Dk2RssEntry.get_image_file_cached(params[:url])
    type = MIME::Types.type_for(params[:url])[0].to_s
    send_data(image, :disposition => "inline", :type => type)
  end

  def geo_map
    
  end

end
