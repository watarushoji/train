class Nil < ActiveRecord::Migration
  def change
  	  	change_column :articles, :image, :text, :default => nil
  end
end
