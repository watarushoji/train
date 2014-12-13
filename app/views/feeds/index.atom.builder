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
      	entry.image image_tag(item.image)
      else
      	entry.image image_tag(item.crawl_image)
      end
      entry.updated item.updated_at.to_formatted_s(:rfc822)
      entry.published item.updated_at.to_formatted_s(:rfc822)

    end
  end
end

	