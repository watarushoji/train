require 'carrierwave/orm/activerecord'

class Article < ActiveRecord::Base
	validates :title, presence: true
	validates :content, presence: true
	validates :category, presence: true
	validates :domain, presence: true
	validates :sumnail, presence: true
  validates :image, presence: true

	mount_uploader :image, ImageUploader

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Article.where("title like '%" + "#{search}" + "%' or content like '%" + "#{search}" + "%' ")
    else
      Article.all #全て表示。
    end
  end

end
