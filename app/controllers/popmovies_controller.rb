class PopmoviesController < ApplicationController
  def index
  		@popmovies = Article.order("pv DESC").paginate(page: params[:page], :per_page => 10)
  end
end
