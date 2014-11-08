class ChangeSumnailBinaryToImage < ActiveRecord::Migration
  def change
  	add_index :articles, :created_at
  	reversible do |dir|
  		change_table :articles do |t|
  			dir.up { t.change :sumnail, :image }
  			dir.down { t.change :sumnail, :binary }
  		end
  	end
  end
end
