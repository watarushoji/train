class StaticPagesController < ApplicationController  
  add_breadcrumb "おっぱいの海で泳ぎたい | ホーム/新着", :root_path  
  def home
  	redirect_to root_path
  end
  def contact
  add_breadcrumb "お問い合わせ", "/contact"
  end

  def about
  add_breadcrumb "当サイトについて", "/about"  
  end
end
