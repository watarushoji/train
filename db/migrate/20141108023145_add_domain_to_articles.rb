class AddDomainToArticles < ActiveRecord::Migration
  def change
  	  	add_column :articles, :domain, :string
  end
end
