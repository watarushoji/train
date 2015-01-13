class AvsamplesController < ApplicationController
	
	def new
		if signed_in? 
			@avsample = Avsample.new
		else
			redirect_to root_path 
		end
	end

	def index
		@avsamples = Avsample.search(params[:search]).order("created_at DESC").paginate(page: params[:page], :per_page => 10)
		@search_words = params[:search]

	end
	def show
		@avsample = Avsample.find(params[:id])
		@avsample.increment(:pv, by = 1)
		@avsample.save
	end

	def edit
		if signed_in? 
			@article = Avsample.find(params[:id])
		else
			redirect_to root_path 
		end
	end
	def update
		   @article = Avsample.find(params[:id])
    	if @article.update_attributes(avsample_params)
      		 flash[:success] = "Avsample updated"
      		 redirect_to root_path
    	else
      		render 'edit'
    	end
	end

	def create
		@article = Avsample.new(avsample_params)
		if @article.save
			flash.now[:success] = "Successfully Posted!"
			redirect_to new_avsample_path
		else
			render 'new'
		end
	end
    
    def destroy
    	Avsample.find(params[:id]).destroy
    	flash[:success] = "Avsample destroyed."
    	redirect_to root_path
    end

	private

	def avsample_params
		params.require(:avsample).permit(:title, :content, :affi_title, :affi_link, :actress_name, :sumnail, :image, :site, :pv)
	end
end
