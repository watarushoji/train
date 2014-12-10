class AddCrawlImageToArticle < ActiveRecord::Migration
  def change
   	    add_column :articles, :crawl_image, :text
  end
end
