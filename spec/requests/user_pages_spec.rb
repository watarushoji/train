require 'spec_helper'
require 'rails_helper'

# 一応作ったが、Factoryで管理ユーザを作成するので
# signup page（users/new）を実際に使うことはない。。

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
  end
  
end