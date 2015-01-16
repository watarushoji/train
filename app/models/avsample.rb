class Avsample < ActiveRecord::Base
	validates :title, presence: true
	validates :content, presence: true
	validates :sumnail, presence: true
	mount_uploader :image, ImageUploader
  
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Avsample.where("title like '%" + "#{search}" + "%' or content like '%" + "#{search}" + "%' ")
    else
      Avsample.all #全て表示。
    end
  end

end
