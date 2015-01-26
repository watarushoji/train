class AddMaincategoryToCategory < ActiveRecord::Migration
  def change
  	    add_column :categories, :maincateogry, :string, :default => "others"
  end
end
