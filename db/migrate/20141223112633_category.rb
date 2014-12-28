class Category < ActiveRecord::Migration
  def change
  	    add_column :categories, :score, :string
  end
end
