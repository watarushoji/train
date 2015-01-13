class Avsample < ActiveRecord::Base

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Avsample.where("title like '%" + "#{search}" + "%' or content like '%" + "#{search}" + "%' ")
    else
      Avsample.all #全て表示。
    end
  end

end
