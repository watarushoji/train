class ArticlesController < ApplicationController
  def new
  end
  def show
  	add_breadcrumb "#{Article.find(params[:id]).title}", article_path 
  	@article = Article.find(params[:id])
  end
end
