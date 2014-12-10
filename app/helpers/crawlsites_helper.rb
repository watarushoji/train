module CrawlsitesHelper
	require 'open-uri'
	def crawl_xvideos

		doc = Nokogiri::HTML(open("http://jp.xvideos.com/"), nil, "UTF-8")   

		parsed_data = {}
		index = 0  

		@domain = "http://jp.xvideos.com/"
		@iframe_url ||= 'http://flashservice.xvideos.com/embedframe/'
		@movies_limit ||= -1
		@tags_limit ||= -1

		parsed_data = {}
		index       = 0

		doc.xpath('//div[@class="thumbBlock"]/div[@class="thumbInside"]').each do |post|
			begin
	    	  	# limit
	    	  	break if @movies_limit == index
	    	  	parsed_data[index] = {}
	      		# thumbnail infomation
	      		post.search('div[@class="thumb"]/a').each do |a|
	      			parsed_data[index]['movie_page_url'] = "#{@domain}#{a.attribute('href').value}"
	      			parsed_data[index]['movie_thumnail_url'] = "#{a.children.attribute('src').value}"
	      		end

	      		# if script tag is contained
	      		post.search('script').each do |elm|
	      			parsed_data[index]['movie_page_url'] = @domain + (elm.children[0].content.match(/href="(.+?)">/))[1]
	      			parsed_data[index]['movie_thumnail_url'] = (elm.children[0].content.match(/src="(.+?)"/))[1]
	      			parsed_data[index]['description'] = (elm.children[0].content.match(/<p><a href=".+">(.+)<\/a><\/p>/))[1]
	      		end

	      		# movie_id
	      		parsed_data[index]['movie_id'] = parsed_data[index]['movie_page_url'].match(/\/video(\d+)\/.*/)[1]

	      		# iframe url
	      		parsed_data[index]['movie_url'] = @iframe_url + (parsed_data[index]['movie_page_url'].match(/\/video(\d+)\/.*/))[1]

	      		# description
	      		post.search('p/a').each do |a|
	      			parsed_data[index]['description'] = a.inner_text
	      		end

	      		# metadata
	      		post.search('p[@class="metadata"]/span[@class="bg"]').each do |span|
	      			text = span.inner_text.gsub(/(\t|\s|\n)+/,'')
	      			parsed_data[index]['duration'] = (text.match(/\(.+\)/))[0]
	      			parsed_data[index]['movie_quality'] = text.sub(/\(.+\)/,'')
	      		end
	      		# @crawl = Crawlsite.new
	      		# @crawl.thumb = parsed_data[index]['movie_thumnail_url']
	      		# @crawl.title = parsed_data[index]['description']
	      		# @crawl.uri = parsed_data[index]['movie_page_url']
	      		# @crawl.embed = parsed_data[index]['movie_url']
	      		# @crawl.time = parsed_data[index]['duration']
	      		# @crawl.sitename = 'xvideos'
	      		# @crawl.save!

  	   			Crawlsite.create!(
  		    		thumb: 		parsed_data[index]['movie_thumnail_url'],
             		title:    	parsed_data[index]['description'],
             		uri: 		parsed_data[index]['movie_page_url'],
	             	embed: 		parsed_data[index]['movie_url'],
	             	time: 		parsed_data[index]['duration'],
	             	sitename: 	'xvideos'
	            )
	            
	      		index += 1
	      		rescue Exception => e
	      		raise e
      		end
      	end
      	# i=[0..19]
      	# i.each do |index|
      	# 		Crawlsite.create!(
  		   #  		thumb: 		parsed_data[index]['movie_thumnail_url'],
       #       		title:    	parsed_data[index]['description'],
       #       		uri: 		parsed_data[index]['movie_page_url'],
	      #        	embed: 		parsed_data[index]['movie_url'],
	      #        	time: 		parsed_data[index]['duration'],
	      #        	sitename: 	'xvideos'
	      #       )
      	# end

  	end

  def crawl_xHamster

  	# xHamster = Nokogiri::HTML(open("http://jp.xhamster.com/channels/top-weekly-japanese-1.html"))   
  	# thumbox_xHamster = xHamster.css("div.video")
  	# thumbox_xHamster.each do |content|
  	# 	@title_xHamster = content.css("u").text
  	# 	@meta_xHamster = content.css("img.hSprite")
  	# end
  end


end
