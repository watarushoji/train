class Tostring < ActiveRecord::Migration
  def change
  	drop_table(:articles)
  end
end
