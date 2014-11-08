class AddSumnailToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :sumnail, :binary
  end
end
