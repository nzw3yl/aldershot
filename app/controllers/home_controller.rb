class HomeController < ApplicationController
    layout :home_layout

    def index
      @user = current_user || User.new
      @activities = Activity.order("created_at desc")
    end


  private
    def home_layout
      user_signed_in? ? "application" : "splash"
    end
end
