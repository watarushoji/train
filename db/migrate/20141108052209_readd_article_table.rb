class ReaddArticleTable < ActiveRecord::Migration
  def change
  	create_table :articles do |t|
  		t.string :title
  		t.string :content
  		t.string :category
  		t.string :sumnail
  		t.string :domain
  	end
  end
end
