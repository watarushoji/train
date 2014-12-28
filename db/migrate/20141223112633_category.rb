class Category < ActiveRecord::Migration
  def change
  	    add_column :categories, :score, :integer, :default => 0
  end
end
