
xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "おっぱいの海で泳ぎたい"
    xml.description "新着記事"
    xml.link "http://dive-in-boobs.com"
 
    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.content
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.guid "http://dive-in-boobs.com/articles/#{post.id}"
        xml.link "http://dive-in-boobs.com/articles/#{post.id}"
      end
    end
  end
end