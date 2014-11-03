class Article < ActiveRecord::Base
	validates :title, presence: true
	validates :content, presence: true
	validates :category, presence: true

end
