Given /^I am on Home page$/ do
  @home_page = HomePage.new
  @signup_page = Registration.new
  @home_page.navigate
end

When(/^I click on (.*)$/) do |button_name|
 @home_page.click_on(button_name)
end

When(/^I enter in my details in sign up form$/) do
  @signup_page.enter_user_details
end

Then(/^I should register successfully$/) do
  expect(@signup_page.registered_user).to have_text("First#{@signup_page.random_name} Last#{@signup_page.random_name}")
end

Then(/^the (.*) page should NOT include a title field$/) do |page_name|
  expect(page).to have_no_selector("#user_title")
end


Then(/^I should see (.*)$/) do |text|
  expect(@home_page.favourite_header_text).to have_text(text)
end

And(/^I click (.*) button$/) do |button_name|
  @signup_page.click_on_button(button_name)
end

And(/^I enter in my details as a guest$/) do
  @signup_page.enter_guest_user_details
end

Then(/^I enter in my address details$/) do
  @signup_page.enter_address_details
end

And(/^I should not see title with my user name$/) do
  expect(@signup_page.user_name_display.first).to have_text("First#{@signup_page.random_name} Last#{@signup_page.random_name}")
end

And(/^I should not see title field in My Accounts page$/) do

end