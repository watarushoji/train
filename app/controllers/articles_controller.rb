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
			flash[:success] = "Successfully Posted!"
			render 'new'
		else
			render 'new'
		end
	end
	def index
		@articles = Article.paginate(page: params[:page], :per_page => 5)
	end

	private

	def article_params
		params.require(:article).permit(:title, :category, :content)
	end
end
