#Navigate to google.co.uk
Given(/^I am on the Google homepage$/) do
    visit 'https://www.google.co.uk/'
end

#Write "yahoo" search text to the search bar  
When(/^I will search for "([^"]*)"$/) do |searchText|
    # fill_in 'form input[name=q]', :with => searchText
    fill_in 'q', :with => searchText
    # fill_in 'input', :with => searchText
end

#In the current page, we should see "yahoo" text
Then(/^I should see "([^"]*)"$/) do |expectedText|
    page.should have_content(expectedText)
end

#Click the yahoo link 
Then(/^I will click the yahoo link$/) do
    click_link('Yahoo')
end

#Wait 10 seconds statically to see yahoo website
Then(/^I will wait for (\d+) seconds$/) do |waitTime|
    sleep (waitTime.to_i)
end

Given(/^I am on the assignment (\d+) edit page$/) do |assignment_id|
#   pending # Write code here that turns the phrase above into concrete actions
#   visit "/assignments/#{assignment_id}/edit"
  visit "/assignments/95/edit"
#   visit "/assignments/"
end

When(/I switch to (.*) tab/) do |s|
    click_link(s)
end


When(/^I click on "([^"]*)"$/) do |str|
    click(str)
end

When("I click on {string}") do |str|
end

Then(/^I should be on "([^"]*)"$/) do |string|
    expect(page).to have_current_path(string)
end


When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |name, value|
  fill_in name, :with => value
end


Then(/^see "([^"]*)"$/) do |arg1|
#   pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_content(string)
end
