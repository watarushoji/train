class CgrpagesController < ApplicationController
	def index
		name = "おっぱい"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end

	def avactless
		name = "AV女優"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def beautifull
		name = "美少女"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def nowgirls
		name = "ギャル"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def amateur
		name = "素人"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def planned
		name = "企画"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def fetish
		name = "フェチ"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def peeping
		name = "盗撮"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def scatology
		name = "放尿/脱糞"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def jk
		name = "女子高生"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def jd
		name = "女子大生"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def happenings
		name = "ハプニング"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def idol
		name = "アイドル"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def bigboobs
		name = "巨乳"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def beauty
		name = "美女"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def dynamiteboobs
		name = "爆乳"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def tinyboobs
		name = "貧乳"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def wellshapedboobs
		name = "美乳"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def publicexposure
		name = "野外露出"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def accident
		name = "放送事故"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def fellahandjob
		name = "フェラ/手コキ"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def incest
		name = "近親相姦"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def pies
		name = "中出し"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def livechat
		name = "ライブチャット"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def pantyshots
		name = "パンチラ"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
	end
	def downblouse
		name = "胸チラ"
		cgrpages_get_paginate(name)
		cgrpages_get_pv_paginate(name)
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