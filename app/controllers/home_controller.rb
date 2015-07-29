class HomeController < ApplicationController
  respond_to :json

  def index
  end

  def search
    respond_with Search.new(params[:text]).result, location: search_path
  end
end
