module PrioritiesHelper
  def priority_display_class(highlow)
    highlow ? "prio-high-panel radius callout" : "prio-low-panel radius lower" 
  end
  
  def priority_display_link(highlow)
		highlow ? '<i class="fi-next"></i> Push' : '<i class="fi-flag"></i> Today'
  end
end
