class ArticlesController < ApplicationController
	def new
		if signed_in? 
			@article = Article.new
		else
			redirect_to root_path 
		end
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		   @article = Article.find(params[:id])
    	if @article.update_attributes(article_params)
      		 flash[:success] = "Article updated"
      		 redirect_to @article
    	else
      		render 'edit'
    	end
	end

	def show
		@article = Article.find(params[:id])
		@article.increment(:pv, by = 1)
		@article.save
		@sitemaparticles = Article.all.order("created_at DESC")
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
		@articles = Article.search(params[:search]).order("created_at DESC").paginate(page: params[:page], :per_page => 10)
		@search_words = params[:search]
		# @articles = Article.order("created_at DESC")
		# @first_article = @orderd_article.first

    end
    def destroy
    	Article.find(params[:id]).destroy
    	flash[:success] = "Article destroyed."
    	redirect_to root_path
    end

		
	private

	def article_params
		params.require(:article).permit(:title, :category,:category2,:category3,:category4, :content, :sumnail, :domain, :image, :pv, :from_crawl, :crawl_image, :site)
	end

end
