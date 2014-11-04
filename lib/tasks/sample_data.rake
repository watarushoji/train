namespace :db do
  desc "Fill database with Admin User"
  task populate: :environment do
    User.create!(name: "Hajime Tanaka",
                 email: "watermelons.info@gmail.com",
                 password: "FooBAR4$%&",
                 password_confirmation: "FooBAR4$%&",
                 admin: "true")
  end
end