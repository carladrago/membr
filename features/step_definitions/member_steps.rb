Given /^I chose to add a new member$/ do
  visit("/members/new")
end

When /^I add a new member with details:$/ do |table|
  data = table.rows_hash
  @name = data['name']
  @ic_number = data['ic_number']
  @doj = data['doj']
  @donation = data['donation']
  @phone = data['phone']
  fill_in('member_name', :with => @name)
  fill_in('member_ic_number', :with => @ic_number)
  fill_in('member_doj', :with => @doj)
  fill_in('member_donation', :with => @donation)
  fill_in('member_phone', :with => @phone)
  click_button('Save')
end

Then /^I see a confirmation of the member's details$/ do
  page.should have_content(@name)
  page.should have_content(@ic_number)
  page.should have_content(@doj)
  page.should have_content(@donation)
  page.should have_content(@phone)
end