class PrioritiesController < ApplicationController
  def new
    @priority = Priority.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @priority }
      format.js
    end
  end

  def index
    @priority = Priority.new
    @priorities = Priority.active_by_user(current_user)
  end
  
  def create
    @user = current_user
    @priority = @user.priorities.new(priority_params)
    if @priority.save
      redirect_to priorities_path, notice: "new priority added"
    else
      redirect_to action: :index
    end
  end
  
  def completed
    @priority = Priority.find(params[:id])
    @priority.update_attribute :complete, true
    @priorities = Priority.active_by_user(current_user)
    respond_to do |format|
      format.html { redirect_to(priorities_path) }
      format.js
    end
  end
  
  def urgency
    @priority = Priority.find(params[:id])
    @priority.update_attribute :high, @priority.toggle_urgent
    @priorities = Priority.active_by_user(current_user)
    respond_to do |format|
      format.html { redirect_to(priorities_path) }
      format.js
    end
  end
  
  private
    def priority_params
      params.require(:priority).permit(:content, :complete, :high)
    end
end
