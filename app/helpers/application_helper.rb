module ApplicationHelper
	def full_title(page_title)
		if (page_title == "")
			"おっぱいの海で泳ぎたい"
		else
			"おっぱいの海で泳ぎたい | #{page_title}"
		end
	end
end
