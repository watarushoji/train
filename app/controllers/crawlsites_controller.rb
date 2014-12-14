class CrawlsitesController < ApplicationController
	include CrawlsitesHelper
	def index
		crawl_xvideos
		name = 'xvideos'
		@crawl_data = Crawlsite.where(["sitename = ?", name])
	end
	def new
		@path = request.path_info
		@id = @path.match(/[1-9][0-9]*/)[0].to_i    
		if signed_in? 
			@crawl = Crawlsite.find(@id)
			@article = Article.new
		else
			redirect_to root_path 
		end
	end
	def create
		@article = Article.new(article_params)
		@article.from_crawl = true
		if @article.save
			flash.now[:success] = "Successfully Posted!"
			redirect_to new_article_path
		else
			render 'new'
		end
	end
	def delete_all_records
		Crawlsite.delete_all
		redirect_to :action => 'index'
	end
end


	private

	def article_params
		params.require(:article).permit(:title, :category,:category2,:category3,:category4, :content, :sumnail, :domain, :image, :pv, :from_crawl, :crawl_image, :site)
	end