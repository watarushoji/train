class SitemapsController < ApplicationController
  def sitemaps
  	@sitemaparticles = Article.all.order("created_at DESC")
  end
end
