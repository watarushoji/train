require 'rails_helper'

describe Article do

  before { @article = Article.new(title: "このおっぱいがすごい", content: "おおおっおっぱい！おおおっおっぱい！", category: "おっぱい") }
  subject { @article }
  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:category) }
  it { should be_valid}
  describe "When article title is not present" do
  	before { @article.title = " " }
  	it { should_not be_valid }
  end
  describe "When article content is not present" do
  	before { @article.content = " " }
  	it { should_not be_valid }
  end
  describe "When article category is not present" do
  	before { @article.category = " "}
  	it { should_not be_valid }
  end
end