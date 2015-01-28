class SitemapsController < ApplicationController
  
  add_breadcrumb "おっぱいの海で泳ぎたい | ホーム/新着", :root_path
  def sitemaps
  	@sitemaparticles = Article.all.order("created_at DESC").limit(5)
  	@sitemappopulars = Article.all.order("pv DESC").limit(5)
    add_breadcrumb "サイトマップ", "/sitemaps"
  end
end
