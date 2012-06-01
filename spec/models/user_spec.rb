require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "Example user name", :email => "user@example.com" }
  end

  it "should create a new instance given valid attributes" do
    User.create! @attr
  end

  it "should require a name" do
    no_name = User.new @attr.merge(:name => "")
    no_name.should_not be_valid
  end

  it "should require an email address" do
    no_email = User.new @attr.merge(:email => "")
    no_email.should_not be_valid
  end

  it "should accept valid email addresses" do
    addr = %w[user@domain.com THE_USER@foo.bar.org first.last@foo.jp]
    addr.each do |val|
      usr = User.new @attr.merge(:email => val)
      usr.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject names that are too long" do
    long_name = "a"*51
    long_name_user = User.new @attr.merge(:name => long_name)
    long_name_user.should_not be_valid
  end

  it "should reject duplicate emails" do
    User.create! @attr
    user_with_same_email = User. new @attr
    user_with_same_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
end
