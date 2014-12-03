module ApplicationHelper
	def full_title(page_title)
		if (page_title == "")
			"おっぱいの海で泳ぎたい"
		else
			"おっぱいの海で泳ぎたい | #{page_title}"
		end
	end

	def cgrpages_count(name)
		Article.where(["category = ? or category2 = ? or category3 = ? or category4 = ?", name, name, name, name]).count
	end

	def popular_sidebar
		@popular = Article.where(:created_at=> 1.months.ago..Time.now).order("pv DESC")
	end

	class CommentScrubber < Rails::Html::PermitScrubber
 		def allowed_node?(node)
    		!%w(form script comment blockquote).include?(node.name)
  		end

	    def skip_node?(node)
    		node.text?
  		end

  		def scrub_attribute?(name)
    		name == "style"
  		end
	end
	def sanitize_html(html)
		scrubber = Rails::Html::PermitScrubber.new
		scrubber.tags = ['a','img','src','iframe','script','height','width','frameborder']
		html_fragment = Loofah.fragment(html)
		html_fragment.scrub!(scrubber)
	end
end
