namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(username: "test",
                 name: "Full Name",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    (2..100).each do |n|
      username  = Faker::Internet.user_name
      name = Faker::Name.name
      password  = "password"
      User.create!(username: username,
                   name: name,
                   password: password,
                   password_confirmation: password)
      puts "#{n}: #{name} added with username: #{username}"
    end

    (1..100).each do |n|
        5.times do |m|
        title = Faker::Lorem.sentence(6)
        content = Faker::Lorem.paragraph
        user_id = n
        Answer.create!(title: title,
                       content: content,
                       user_id: user_id)
        puts "user #{user_id} posted: #{title}"
      end
    end
  end
end