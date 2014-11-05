spec.factories.rb

FactoryGirl.define do
  factory :article do
    title     "タイトル1"
    content    "コンテンツ1"
    category	"カテゴリー1"
  end
  factory :user do
  	name "tarotaro"
  	email "taro@example.com"
  	password "foobar"
  	password_confirmation "foobar"
  end
end
