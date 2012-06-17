require 'spec_helper'

describe "FriendlyForwardings" do
  it "should forward to the requested page after signin" do
    user = Factory :user
    visit edit_user_path(user)
    # we should be redirected to user_path
    # where we are logging in
    fill_in :email, :with => user.email
    fill_in :password, :with => user.password
    click_button
    # and finally get the edit_user_path page
    response.should render_template('users/edit')
  end
end
