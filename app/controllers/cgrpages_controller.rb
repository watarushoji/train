class CgrpagesController < ApplicationController
	def index
		name = "おっぱい"
		cgrpages_get_paginate(name)
	end
	def show
	end
	def avactless
		name = "AV女優"
		cgrpages_get_paginate(name)
	end
	def beautifull
		name = "美少女"
		cgrpages_get_paginate(name)
	end
	def nowgirls
		name = "ギャル"
		cgrpages_get_paginate(name)
	end
	def amateur
		name = "素人"
		cgrpages_get_paginate(name)
	end
	def planned
		name = "企画"
		cgrpages_get_paginate(name)
	end
	def fetish
		name = "フェチ"
		cgrpages_get_paginate(name)
	end
	def peeping
		name = "盗撮"
		cgrpages_get_paginate(name)
	end
	def scatology
		name = "放尿/脱糞"
		cgrpages_get_paginate(name)
	end
	def jk
		name = "女子高生"
		cgrpages_get_paginate(name)
	end
	def jd
		name = "女子大生"
		cgrpages_get_paginate(name)
	end
	def happenings
		name = "ハプニング"
		cgrpages_get_paginate(name)
	end
	def idol
		name = "アイドル"
		cgrpages_get_paginate(name)
	end
	private
	def cgrpages_get_paginate(name)
		@cgrpages = Article.where(["category = ? or category2 = ? or category3 = ? or category4 = ?", name, name, name, name]).order("created_at DESC").
		paginate(page: params[:page], :per_page => 5)
	end
end