require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :name => "Example user name",
      :email => "user@example.com",
      :password => "123456",
      :password_confirmation => "123456"
    }
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

  describe "password validation" do
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "wrong")).should_not be_valid
    end

    it "should reject short passwords" do
      short = "a"*5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a"*41;
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end

  end


  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to :encrypted_password
    end

    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end

    it "should be true if the password match" do
      @user.has_password?(@attr[:password]).should be_true
    end

    it "should be false if the password don't match" do
      @user.has_password?("wrong").should be_false
    end

  end

  describe "authentificate method" do
    it "should return nil on email/password mismatch" do
      wrong_password_user = User.authentificate(@attr[:email], "wrong")
      wrong_password_user.should be_nil
    end

    it "should return nil for an email address with no user" do
      nonexistent_user = User.authentificate("wrong@email.addr", @attr[:password])
      nonexistent_user.should be_nil
    end

    it "should return the user on email/password match" do
      matching_user = User.authentificate(@attr[:email], @attr[:password])
      matching_user.should == @user
    end
  end

  describe "admin attibutes" do
    before :each do
      @user = User.create! @attr
    end

    it "should respond to admin" do
      @user.should respond_to :role
    end

    it "should not be an admin by defaut" do
      @user.should_not be_admin
    end

    it "should be convertable to admin" do
      @user.role = "admin"
      @user.should be_admin
    end
  end

  describe "orders association" do
    before :each do
      @user = User.create @attr
    end

    it "should have an orders attribute" do
      @user.should respond_to :orders
    end
  end
end
