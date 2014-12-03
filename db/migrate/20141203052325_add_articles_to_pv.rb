class AddArticlesToPv < ActiveRecord::Migration
  def change
  	    add_column :articles, :pv, :integer
  end
end
