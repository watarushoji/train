class ArticlesController < ApplicationController
	def new
		if signed_in? 
			@article = Article.new
		else
			redirect_to root_path 
		end
	end

	def show
		@article = Article.find(params[:id])
	end
	def create
		@article = Article.new(article_params)
		if @article.save
			flash.now[:success] = "Successfully Posted!"
			redirect_to new_article_path
		else
			render 'new'
		end
	end
	def index
		@articles = Article.search(params[:search]).order("created_at DESC").paginate(page: params[:page], :per_page => 5)
		# @articles = Article.order("created_at DESC")
		# @first_article = @orderd_article.first
    end
		

	private

	def article_params
		params.require(:article).permit(:title, :category,:category2,:category3,:category4, :content, :sumnail, :domain, :image)
	end
end
