### UTILITY METHODS ###

def create_high_priority
  @priority ||= { :content => "High priority content and description"}
end

def create_low_priority
  @priority ||= { :content => "Low priority content and description", :high => false}
end

def add_high_priority
  visit '/priorities'
  create_high_priority
  fill_in "priority_content", :with => @priority[:content]
  click_button "Create Priority"
end

def add_low_priority
  visit '/priorities'
  create_low_priority
  fill_in "priority_content", :with => @priority[:content]
  uncheck "priority_high"
  click_button "Create Priority"
end

def mark_priority_completed
  visit '/priorities'
  page.first(:link, "Complete").click
end

def lower_priorty
  visit '/priorities'
  page.first(:link, "Push").click
end

def raise_priorty
  visit '/priorities'
  page.first(:link, "Today").click
end

### WHEN ###
When /^I add a high priority$/ do
  add_high_priority
end

When /^I add a low priority$/ do
  add_low_priority
end

When /^I mark a priority as complete$/ do
  mark_priority_completed
end

When /^I push a priority lower$/ do
  lower_priorty
end

When /^I raise a priority higher$/ do
  raise_priorty
end

### THEN ###
Then /^I should have a high priority in my queue$/ do
  visit '/priorities'
  page.should have_content "Push"
  page.should have_css('div#priorities div.callout')
end

Then /^I should have a low priority in my queue$/ do
  visit '/priorities'
  page.should have_css('div#priorities div.lower')
end

Then /^I should not have a high priority in my queue$/ do
  visit '/priorities'
  page.should_not have_content "Push"
  page.should_not have_css('div#priorities div.callout')
end

Then /^I should not have a low priority in my queue$/ do
  visit '/priorities'
  page.should_not have_css('div#priorities div.lower')
end