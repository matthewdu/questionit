namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(username: "test",
                 name: "Full Name",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      username  = Faker::Name.name
      name = Faker::Internet.user_name
      password  = "password"
      User.create!(username: username,
                   name: name,
                   password: password,
                   password_confirmation: password)
      puts "#{name} added with username: #{username}"
    end
  end
end