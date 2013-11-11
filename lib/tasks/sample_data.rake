namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Kailong Li",
                 email: "long_kl@126.com",
                 password: "8420278",
                 password_confirmation: "8420278",
		 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
