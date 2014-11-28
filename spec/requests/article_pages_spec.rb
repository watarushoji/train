require 'spec_helper'

describe "Article Pages" do

	subject { page }

	let(:user){ FactoryGirl.create(:user) }
	before do
		visit signin_path
		fill_in "Email", with:user.email.upcase
		fill_in "Password", with:user.password
		click_button "Sign in"
	end

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
				click_button submit
			end
		end
	end
end
