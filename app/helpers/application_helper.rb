module ApplicationHelper
	def full_title(page_title)
		if (page_title == "")
			"おっぱいの海で泳ぎたい"
		else
			"おっぱいの海で泳ぎたい | #{page_title}"
		end
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
