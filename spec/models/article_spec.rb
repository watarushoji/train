require 'rails_helper'

describe Article do

  before { @article = Article.new(title: "このおっぱいがすごい", content: "おおおっおっぱい！おおおっおっぱい！", category: "おっぱい", sumnail: "AST.png", domain: "xvideos.com" ) }
  subject { @article }
  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:category) }
  it { should respond_to(:sumnail) }
  it { should respond_to(:domain) }
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
  describe "When article domain is not present" do
  	before { @article.domain = " "}
  	it { should_not be_valid }
  end
  describe "When article sumnail is not present" do
  	before { @article.sumnail = " "}
  	it { should_not be_valid }
  end

end