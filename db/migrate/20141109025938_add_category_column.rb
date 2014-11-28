class AddCategoryColumn < ActiveRecord::Migration
  def change
  	 add_column :articles, :category2, :string
  	 add_column :articles, :category3, :string
  	 add_column :articles, :category4, :string
  end
end
