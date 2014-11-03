class ArticlesController < ApplicationController
  def new
  	@article = Article.new
  end
  def show
  	@article = Article.find(params[:id])
  end
  def create
  	@article = Article.new(article_params)
  	if @article.save
  		flash[:success] = "Successfully Posted!"
  		redirect_to @article
  	else
  		render 'new'
  	end
  end
  def index
  	redirect_to root_path
  end

  private

  	def article_params
  		params.require(:article).permit(:title, :category, :content)
  	end
end
