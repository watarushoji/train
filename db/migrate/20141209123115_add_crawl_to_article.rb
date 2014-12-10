class AddCrawlToArticle < ActiveRecord::Migration
  def change
  	    add_column :articles, :from_crawl, :boolean, default: false
  end
end
