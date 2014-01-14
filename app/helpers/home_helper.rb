module HomeHelper
  def time_ago(create_date)
    @diff_in_seconds = (Time.now - create_date).to_i
    if @diff_in_seconds > 86400
      create_date.strftime("%B")[0..2] + "-" + create_date.day.to_s
    elsif @diff_in_seconds > 3600
      (@diff_in_seconds/3600).to_i.to_s + " h"
    else
      (@diff_in_seconds/60).to_i.to_s + " m"
    end
  end
  
  def feed_icon(action)
    case action
    when "create"
      '<i class="feed-icon fi-flag"></i>'
    when "completed"
      '<i class="feed-icon fi-trophy"></i>'
    when "destroy"
      '<i class="feed-icon fi-x"></i>'
    else
      '<i class="feed-icon fi-info"></i>'
    end
  end
  
end
