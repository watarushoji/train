class ChangeScoreToInteger < ActiveRecord::Migration
  def change
  	  	change_column :categories, :score, :integer, :default => 0
  end
end
