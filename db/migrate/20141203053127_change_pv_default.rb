class ChangePvDefault < ActiveRecord::Migration
  def change
  	change_column :articles, :pv, :integer, :default => 0
  end
end
