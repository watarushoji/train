class AddSiteToArticle < ActiveRecord::Migration
  def change
  	   	add_column :articles, :site, :string
  end
end
