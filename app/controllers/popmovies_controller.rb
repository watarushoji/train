class PopmoviesController < ApplicationController
	add_breadcrumb "おっぱいの海で泳ぎたい | ホーム/新着", :root_path
	def index
		@popmovies = Article.order("pv DESC").paginate(page: params[:page], :per_page => 10)
		add_breadcrumb "人気", popmovies_path  
	end
end
