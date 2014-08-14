namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(username: "test",
                 name: "Full Name",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      username  = Faker::Internet.user_name
      name = Faker::Name.name
      password  = "password"
      User.create!(username: username,
                   name: name,
                   password: password,
                   password_confirmation: password)
      puts "#{name} added with username: #{username}"
    end

    (1..100).each do |n|
        5.times do |m|
        title = Faker::Lorem.sentence(6)
        post = Faker::Lorem.paragraph
        user_id = n
        Answer.create!(title: title,
                       post: post,
                       user_id: user_id)
        puts "user #{user_id} posted: #{title}"
      end
    end
  end
end