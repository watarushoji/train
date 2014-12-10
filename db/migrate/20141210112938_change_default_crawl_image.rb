class ChangeDefaultCrawlImage < ActiveRecord::Migration
  def change
  	  	change_column :articles, :crawl_image, :text, :default => nil
  end
end
