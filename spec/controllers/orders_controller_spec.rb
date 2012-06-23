require 'spec_helper'

describe OrdersController do
  render_views

  describe "new order" do
    it "should work" do
      get 'new'
      response.should be_success
    end
  end
end
