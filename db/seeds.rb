require 'faker'

# # create a few users

# #TODO: Once you have implemented BCrypt - you can use these to seed your database.


# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
# 5.times do
#   User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
# end

15.times do
  start_time = Time.now + (rand(61) - 30).days
  end_time   = start_time + (1 + rand(6)).hours

  Event.create :user_id    => 1,
               :name       => Faker::Company.name,
               :location   => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
               :starts_at => start_time,
               :ends_at   => end_time
end
