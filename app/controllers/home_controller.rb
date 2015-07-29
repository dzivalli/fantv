class HomeController < ApplicationController
  def index
  end

  def search
    uri = URI.parse("http://api.themoviedb.org/3/search/multi")
    uri.query = {
      api_key: '7b5e30851a9285340e78c201c4e4ab99',
      query: params[:keyword]
    }.to_query

    result = MultiJson.load(Net::HTTP.get_response(uri).body)
  end
end
