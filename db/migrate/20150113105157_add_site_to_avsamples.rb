class AddSiteToAvsamples < ActiveRecord::Migration
  def change
    add_column :avsamples, :site, :text
  end
end
