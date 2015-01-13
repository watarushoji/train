class CgrpagesController < ApplicationController
	def index
		redirect_to root_path
	end

	def avactless
		redirect_to root_path
	end
	def beautifull
		redirect_to root_path
	end
	def nowgirls
		redirect_to root_path
	end
	def amateur
		redirect_to root_path
	end
	def planned
		redirect_to root_path
	end
	def fetish
		redirect_to root_path		
	end
	def peeping
		redirect_to root_path
	end
	def scatology
		redirect_to root_path	
	end
	def jk
		redirect_to root_path	
	end
	def jd
		redirect_to root_path	
	end
	def happenings
		redirect_to root_path	
	end
	def idol
		redirect_to root_path	
	end
	def bigboobs
		redirect_to root_path	
	end
	def beauty
		redirect_to root_path	
	end
	def dynamiteboobs
		redirect_to root_path	
	end
	def tinyboobs
		redirect_to root_path	
	end
	def wellshapedboobs
		redirect_to root_path	
	end
	def publicexposure
		redirect_to root_path	
	end
	def accident
		redirect_to root_path	
	end
	def fellahandjob
		redirect_to root_path	
	end
	def incest
		redirect_to root_path
	end
	def pies
		redirect_to root_path
	end
	def livechat
		redirect_to root_path		
	end
	def pantyshots
		redirect_to root_path		
	end
	def downblouse
		redirect_to root_path	
	end


	private
	def cgrpages_get_paginate(name)
		@cgrpages = Article.where(["category = ? or category2 = ? or category3 = ? or category4 = ?", name, name, name, name]).order("created_at DESC").
		paginate(page: params[:page], :per_page => 10)
		@cgrpages_pv = Article.where(["category = ? or category2 = ? or category3 = ? or category4 = ?", name, name, name, name]).order("pv DESC").
		paginate(page: params[:page], :per_page => 10)
		@count = @cgrpages.count
		@name = name
	end
end