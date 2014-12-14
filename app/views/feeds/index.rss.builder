
xml.instruct! :xml, :version => "1.0" 
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
	xml.channel do
		xml.title @title
		xml.subtitle @subtitle
		xml.description @description
		xml.updated @updated.in_time_zone("Tokyo").to_formatted_s(:without_second)
		xml.link @link

		@posts.each do |post|
			xml.item do
				xml.title post.title
				xml.description do
					xml << "<![CDATA["
				 	if post.crawl_image == nil then
				 		xml << image_tag(post.image)
				 	else
				 		xml << image_tag(post.crawl_image)
				 	end
				 	xml << post.content if post.content
				 	xml << "]]>"
				end
				xml.pubDate post.created_at.in_time_zone("Tokyo").to_formatted_s(:without_second)
				xml.guid "http://dive-in-boobs.com/articles/#{post.id}"
				xml.link "http://dive-in-boobs.com/articles/#{post.id}"
			end
		end
	end
end




