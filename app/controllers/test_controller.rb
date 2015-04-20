class TestController < ApplicationController
  def index
    if request.xhr?
      #render body: "{\"a\": \"b\"}"
      render json: {a: "b"}
    end
  end
end
