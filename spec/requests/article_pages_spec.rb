require 'spec_helper'

describe "Article Pages" do

  subject { page }

  let(:article) { FactoryGirl.create(:article) }
  before { visit article_path(article) }

  it { should have_content ("コンテンツ1") }
  it { should have_title("タイトル1") }
  # it { should have_category("カテゴリー1") }

  describe "Create Article" do
  	before { visit new_article_path }
  	let(:submit) { "Create an Article" }
  	describe "with invalid information" do
  	it "should not create a user" do
  		expect { click_button submit }.not_to change(Article, :count)
  	end
  end
  describe "with valid information" do
  	before do
  		fill_in "Title", with: "タイトル1"
  		fill_in "Content", with: "コンテンツ1"
  		fill_in "Category", with: "カテゴリー1"
  	end
  	it "should create a user" do
  		expect { click_button submit }.to change(Article, :count)
  	end
  end

  end
end
