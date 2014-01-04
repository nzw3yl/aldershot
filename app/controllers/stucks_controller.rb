class StucksController < ApplicationController
  def index
    @stuck = Stuck.new
    @stucks = Stuck.active_by_user(current_user)
  end
  
  def create
    @user = current_user
    @stuck = @user.stucks.new(stuck_params)
    @stuck.save
    redirect_to stucks_path, notice: "new stuck added"
  end
  
  def update
    @stuck = Stuck.find(params[:id])
    @stuck.update_attributes(stuck_params)
    respond_to do |format|
      format.html { redirect_to(current_user.id == @stuck.owner_id ? blocks_path : stucks_path) }
      format.js
    end
  end
  
  def completed
    @stuck = Stuck.find(params[:id])
    @stuck.update_attribute :complete, true
    @stucks = Stuck.active_by_user(current_user)
    respond_to do |format|
      format.html { redirect_to(stucks_path) }
      format.js
    end
  end
  
  def unstuck
    @stuck = Stuck.find(params[:id])
    @stuck.update_attribute :complete, true
    @stucks = Stuck.active_blocks(current_user)
    respond_to do |format|
      format.html { redirect_to(blocks_path) }
      format.js
    end
  end
  
  def blocks
    @stucks = Stuck.active_blocks(current_user)
    respond_to do |format|
      format.html 
      format.js
    end
  end
  
  private
    def stuck_params
      params.require(:stuck).permit(:content, :complete, :owner_id)
    end
end
