require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "ex", email: "ex6861@gmail.com", password: "ex6861", password_confirmation: "ex6861")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end
  
  test "password should be present" do
    @user.password = "   "
    assert_not @user.valid?
  end
  
  test "password_confirmation should be present" do
    @user.password_confirmation = "   "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = "a" * 60
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "a" * 255 + "@gmail.com"
    assert_not @user.valid?
  end
  
  test "password should not be too short" do
    @user.password = "a" * 3
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end
  
  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
end
