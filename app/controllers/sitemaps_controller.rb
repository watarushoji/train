class SitemapsController < ApplicationController
  def sitemaps
  	@sitemaparticles = Article.all.order("created_at DESC").limit(5)
  	@sitemappopulars = Article.all.order("pv DESC").limit(5)
  end
end
