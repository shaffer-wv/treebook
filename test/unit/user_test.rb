require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "user should have a unique profile name" do
    user = User.new
  	user.profile_name = "jshaffer"
  	user.first_name = "Jason"
  	user.last_name = "Shaffer"
  	user.email = "jshaffer@nowhere.com"
  	user.password = "password"
  	user.password_confirmation = "password"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
     user = User.new(first_name: "Stephen", last_name: "Wiseman", email: "swiseman@nowhere.com")
    user.password = user.password_confirmation = 'password'
    user.profile_name = "My name with spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: "Stephen", last_name: "Wiseman", email: "swiseman@nowhere.com")
    user.password = user.password_confirmation = 'password'
    user.profile_name = 'swiseman'
    assert user.valid?
  end
end
