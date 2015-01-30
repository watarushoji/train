class CategoriesController < ApplicationController
	add_breadcrumb "おっぱいの海で泳ぎたい | ホーム/新着", :root_path
	def show	
		if params[:id]
			@category_record = Category.where("name = ?", "#{params[:id]}").first 
			@categories = @category_record.articles.order("created_at DESC").paginate(page: params[:page], :per_page => 10)
			@category = @category_record.name
			add_breadcrumb "カテゴリ", "/categories"
			add_breadcrumb "#{params[:id]}", "/articles/categories/#{params[:id]}"			
		else
			flash[:success] = "カテゴリが見つかりません"
			redirect_to root_path
		end
	end
	def index
		add_breadcrumb "カテゴリ", "/categories"

	end

	def articles_categories
		if signed_in?
			@category = Category.all.order("score DESC")
		else
			redirect_to root_path
		end

	end


	def popular

		if params[:id]
			@category_record = Category.where("name = ?", "#{params[:id]}").first 
			@categories = @category_record.articles.order("pv DESC").paginate(page: params[:page], :per_page => 10)
			@category = @category_record.name
			add_breadcrumb "カテゴリ", "/categories"
			add_breadcrumb "#{params[:id]}", "/articles/categories/#{params[:id]}"
			add_breadcrumb "人気順", "/articles/categories/#{params[:id]}/popular"			
		else
			flash[:success] = "カテゴリが見つかりません"
			redirect_to root_path
		end
	end

	def new
		if signed_in? 
			@category = Category.new
		else
			redirect_to root_path 
		end
	end
	def edit
		if signed_in? 
			@category = Category.find(params[:id])
		else
			redirect_to root_path
		end
	end
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			flash[:success] = "Category updated"
			redirect_to '/articles_categories'
		else
			render 'edit'
		end
	end
	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Successfully Created!"
			redirect_to '/articles_categories'
		else
			render 'new'
		end
	end
	def destroy
		Category.find(params[:id]).destroy
		flash[:success] = "Article destroyed."
		redirect_to '/articles_categories'
	end

	private

	def category_params
		params.require(:category).permit(:name, :score, :maincateogry)
	end

end
