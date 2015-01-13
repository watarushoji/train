class AddPvToAvsamples < ActiveRecord::Migration
  def change
    add_column :avsamples, :pv, :integer, :default => 0
  end
end
