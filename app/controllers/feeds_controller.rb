class FeedsController < ApplicationController
    def index
    	@title = "おっぱいの海で泳ぎたい | 新着情報"
    	@posts = Article.order("created_at DESC")
    	@updated = @posts.first.updated_at unless @posts.empty?
    	@link = "http://dive-in-boobs.com/"
    	@description = "「オナニータイムは節約せよ」を標語に良質で抜ける動画を配信しています"
    	@subtitle = "I wanna dive in boobs"

    	respond_to do |format|
    		format.html
    		format.atom{ render :layout => false }
    	end
    end
end
