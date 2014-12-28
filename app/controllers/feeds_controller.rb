class FeedsController < ApplicationController
    def index
    	@title = "おっぱいの海で泳ぎたい | 新着情報"
    	@posts = Article.order("created_at DESC")
    	@updated = @posts.first.created_at unless @posts.empty?
    	@link = "http://dive-in-boobs.com/"
    	@description = "「オナニータイムは節約せよ」を標語に良質で抜ける動画を配信しています"
    	@subtitle = "I wanna dive in boobs"
    	@user = User.find(1)

    	respond_to do |format|
    		format.html
    		format.rss{ render :layout => false }
    	end
    end
end
