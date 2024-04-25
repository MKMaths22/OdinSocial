# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Profile.delete_all
Comment.delete_all
Like.delete_all
FollowRequest.delete_all
Follow.delete_all
Post.delete_all
User.delete_all

names_array = ['Peter', 'Chris', 'Ste', 'Rachael', 'Tom', 'Andrew', 'Brian', 'Charles', 'David', 'Edward', 'Fred', 'George', 'Harold', 'Imelda', 'Janice', 'Keith']
names_array.each do |person|
  User.create(name: person, email: person.downcase.concat('@gmail.com') , password: 'abcdef', password_confirmation: 'abcdef', confirmed_at: Time.now)
end

posts_array = [['Attention', 'The quick brown fox', 'Tom'], 
['Danger', 'Jumps over the lazy dog', 'Brian'],
['Supermarkets', 'Sell you groceries', 'Charles']]
posts_array.each do |subarray|
  Post.create(title: subarray[0], body: subarray[1], author: User.find_by(name: subarray[2]))
end

comments_array = [['This post sucks.', 'Peter', 'Attention']]
comments_array.each do |subarray|
  Comment.create(body: subarray[0], author: User.find_by(name: subarray[1]), post: Post.find_by(title: subarray[2]))
end

likes_array = [['Peter', 'Attention'], ['Peter', 'Supermarkets'], ['Chris', 'Supermarkets']]
likes_array.each do |subarray|
  Like.create(liker: User.find_by(name: subarray[0]), liked_post: Post.find_by(title: subarray[1]))
end

follows_array = [['Peter', 'Chris']]
follows_array.each do |subarray|
  Follow.create(follower: User.find_by(name: subarray[0]), followee: User.find_by(name: subarray[1]))
end

follow_requests_array = [['Chris', 'Peter']]
follow_requests_array.each do |subarray|
  FollowRequest.create(requester: User.find_by(name: subarray[0]), requestee: User.find_by(name: subarray[1]))
end





