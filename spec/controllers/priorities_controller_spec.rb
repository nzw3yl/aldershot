require 'spec_helper'

describe PrioritiesController do
  
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'new'" do
    it "returns http success" do
      sign_in
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      sign_in
      get 'index'
      response.should be_success
    end
  end

end
