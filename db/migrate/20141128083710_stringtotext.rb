class Stringtotext < ActiveRecord::Migration
  def change
  	change_column(:articles, :content, :text)
  	change_column(:articles, :sumnail, :text)
  	change_column(:articles, :domain, :text)
  end
end
