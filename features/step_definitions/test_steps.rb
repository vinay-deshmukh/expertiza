require "byebug"
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
    instructor = create(:instructor, id: 6)

    # login_as("instructor6")

#   def stub_current_user(current_user, current_role_name = 'Student', current_role)
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user) if defined?(session)
#     allow_any_instance_of(ApplicationController).to receive(:current_role_name).and_return(current_role_name)
#     allow_any_instance_of(ApplicationController).to receive(:current_role).and_return(current_role)
#     # Also pop this stub user into the session to support the authorization helper

#     # Check if session is defined to differentiate between controller and non-controller tests.
#     # This is required as the session variable is only defined for controller specs.
#     # Other kinds of specs(feature specs,etc) use an internal rack.session that cannot be interacted with.
#     session[:user] = current_user if defined?(session)
#   end

    # stub_current_user(instructor, instructor.role.name, instructor.role)
    assignment = create(:assignment,
        id: assignment_id,
        name: 'test assignment',
        instructor_id: instructor.id,
        staggered_deadline: true,
        directory_path: 'same path',
        participants: [build(:participant)],
        teams: [build(:assignment_team)],
        course_id: 1
    )
    puts Assignment.all
    # byebug
    visit "/assignments/#{assignment_id}/edit"
    # visit "/assignments/95/edit"
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
