require 'spec_helper'
require 'rails_helper'

# 一応作ったが、Factoryで管理ユーザを作成するので
# signup page（users/new）を実際に使うことはない。。

describe "Static pages" do

	describe "Contact page" do
		it "should have the content 'Contact'" do
			visit contact_path
			expect(page).to have_content('Contact')
		end
		it "shoulc have the title 'Contact" do
			visit contact_path
			expect(page).to have_title('Contact')
		end
	end
	describe "About page" do
		it "should have the content 'About'" do
			visit about_path
			expect(page).to have_content('About')
		end
		it "shoulc have the title 'About" do
			visit about_path
			expect(page).to have_title('About')
		end
	end
	

end
