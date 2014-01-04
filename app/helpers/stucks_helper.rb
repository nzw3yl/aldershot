module StucksHelper
  def stuck_display_content(stuck)
    @display_content = nil 
    if stuck.owner_id
      @user = User.find(stuck.owner_id)
      if @user
        @display_content = raw( '<span class="assigned">' + 
        @user.name + 
        '</span>' + 
        " owns the stuck:  <br />  " + 
        stuck.content)
      end
    end
      @display_content ||= raw('<span class="assigned alert">' + "currently unassigned: </span><br />" + stuck.content)   
  end
  
  def block_display_content(block)
    @display_content = nil 
      @user = User.find(block.user_id)
      if @user
        @display_content = raw( '<span class="assigned">' + 
        @user.name + 
        '</span>' + 
        " assigned you their stuck:  <br />  " + 
        block.content)
      end
      @display_content ||= raw('<span class="assigned alert">' + "orphaned stuck: </span><br />" + block.content)   
  end
end
