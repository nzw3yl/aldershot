require 'spec_helper'

describe Priority do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @attr = {
      :content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor",
      :user_id => @user.id,
      :high => false,
      :complete => false
    }
  end
  
  it "should require content" do
    hash = @attr.merge(:content => "")
    Priority.new(hash).should_not be_valid
  end
  it "should reject long content" do
    long = "a" * 300
    hash = @attr.merge(:content => long)
    Priority.new(hash).should_not be_valid
  end
  
  it "should reject short content" do
    short = "a" * 5
    hash = @attr.merge(:content => short)
    Priority.new(hash).should_not be_valid
  end
end