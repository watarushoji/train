
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
				xml.description post.content
				xml.pubDate post.created_at.in_time_zone("Tokyo").to_formatted_s(:without_second)
				if post.crawl_image == nil then
					xml.image do
						xml.url post.image
						xml.width "230"
						xml.height "150"
					end
				else
					xml.image do
						xml.url post.crawl_image
						xml.width "230"
						xml.height "150"
					end
				end
				xml.guid "http://dive-in-boobs.com/articles/#{post.id}"
				xml.link "http://dive-in-boobs.com/articles/#{post.id}"
			end
		end
	end
end

atom_feed :language => 'ja-JP' do |feed|
	feed.title @title
	feed.subtitle @subtitle
	feed.description @description
	feed.updated @updated
	feed.link @link

	@posts.each do |item|
		next if item.updated_at.blank?

		feed.entry( item ) do |entry|
			entry.url "http://dive-in-boobs.com/articles/#{item.id}"

			entry.title item.title
			entry.content item.content, :type => 'html'
			if item.crawl_image == nil then
				entry.content image_tag(item.image), :type => 'html' 
			else
				entry.content image_tag(item.crawl_image), :type => 'html'
			end
			entry.updated item.updated_at.to_formatted_s(:rfc822)
			entry.published item.updated_at.to_formatted_s(:rfc822)

		end
	end
end


