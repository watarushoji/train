class Article < ActiveRecord::Base
	validates :title, presence: true
	validates :content, presence: true
	validates :category, presence: true
	validates :domain, presence: true
	validates :sumnail, presence: true

end
