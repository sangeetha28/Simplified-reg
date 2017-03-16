Given /^I am on Home page$/ do
  @home_page = HomePage.new
  @signup_page = Registration.new
  @home_page.navigate
end

When(/^I click on (.*)$/) do |button_name|
  @home_page.click_on(button_name)
end

When(/^I enter in my details in sign up form$/) do
  sleep(10)
  @signup_page.enter_user_details
end

Then(/^I should register successfully$/) do
  expect(@signup_page.registered_user).to have_text("First#{@signup_page.random_name} Last#{@signup_page.random_name}")
end

Then(/^the (.*) page should (.*) included a (.*) field$/) do |page_name, status, fieldname|
  save_screenshot
  case fieldname
    when "title"
      if status == "Not Have"
      expect(page).to have_no_selector("#user_title")
      end
    when "contact number"
      if status == "Have"
        (expect(page).to have_selector("#user_telephone_alpha2")) && (expect(page).to have_selector("#user_telephone"))
      else
        (expect(page).to have_no_selector("#user_telephone_alpha2")) && (expect(page).to have_no_selector("#user_telephone"))
      end
    when "address"
      if status == "Have"
        (expect(page).to have_selector(".address_fields_module.module")) &&
          (expect(page).to have_selector("#user_default_billing_address_attributes_post_code")) &&
          (expect(page).to have_selector("#user_default_billing_address_attributes_address1")) &&
          (expect(page).to have_selector("##user_default_billing_address_attributes_address2")) &&
          (expect(page).to have_selector(".find_address_button.button.secondary.medium")) &&
          (expect(page).to have_selector("#user_default_billing_address_attributes_town")) &&
          (expect(page).to have_selector("#user_default_billing_address_attributes_county"))
      else
        puts "Not Have"
        #(expect(page).to have_no_selector(".address_fields_module.module")) &&
        (expect(page).to have_no_selector("#user_default_billing_address_attributes_post_code")) &&
          (expect(page).to have_no_selector("#user_default_billing_address_attributes_address1")) &&
          (expect(page).to have_no_selector("#user_default_billing_address_attributes_address2")) &&
          (expect(page).to have_no_selector(".find_address_button.button.secondary.medium")) &&
          (expect(page).to have_no_selector("#user_default_billing_address_attributes_town")) &&
          (expect(page).to have_no_selector("#user_default_billing_address_attributes_county"))
      end
  end
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

And(/^I navigate to My accounts page$/) do
  @signup_page.navigate_to_myaccounts
end

And(/^I should be given the option to (.*) automatically$/) do |text|
  expect(@signup_page.find_address_link).to have_text(text)
end

And(/^I should be given the option to ENTER ADDRESS MANUALLY$/) do
  expect(@signup_page.find_address_link).to have_text(text)
  @signup_page.enter_address_manually
end


And(/^If I use FIND ADDRESS I should be able to manually edit each of the fields$/) do

end

And(/^I register as a new user$/) do
  steps %Q{
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should register successfully
        }
end

When(/^I enter my email and password and click SIGN IN$/) do
  @signup_page.signin_as_existinguser
end

And(/^I should be taken to (.*) page$/) do |pagename|
  expect(@signup_page.my_details_page).to have_text(pagename.upcase)
end

And(/^name fields should be pre\-populated with first name and last name from previous page$/) do
  (expect(@signup_page.first_name_field).to have_text("First#{@random_name}")) && (expect(@signup_page.last_name_field).to have_text("Last#{@random_name}"))
end

And(/^country should be defaulted to (.*)$/) do |countryname|
  expect(@signup_page.country).to have_text(countryname)
end

And(/^I should be directed to (.*) page with the following fields$/) do |link,table|
  # table is a table.hashes.keys # => [:name, :mandatory]
  expect(page).to have_current_path(link)
  (expect(page).to have_selector(@signup_page.country)) && (expect(page).to have_selector(@signup_page.postcode))
end

Then(/^I should get following error messages$/) do |table|
  # table is a table.hashes.keys # => [:error_messages]
  table.hashes.each do |msg|
    expect(@signup_page.check_yourorder_errmsg).to have_text(msg)
  end
end


Then(/^I should be directed to a sign up form with the following mandatory fields:$/) do |table|
  # table is a table.hashes.keys # => [:fieldnames]
  (expect(page).to have_selector(@signup_page.email_field))&&
    (expect(page).to have_selector(@signup_page.email_confirmation_field)) &&
    (expect(page).to have_selector(@signup_page.first_name_field)) &&
    (expect(page).to have_selector(@signup_page.last_name_field)) &&
    (expect(page).to have_selector(@signup_page.telephone_field)) &&
    (expect(page).to have_selector(@signup_page.telephone_field_code)) &&
    (expect(page).to have_selector(@signup_page.password_field)) &&
    (expect(page).to have_selector(@signup_page.password_confirm_field)) &&
    (expect(page).to have_selector(@signup_page.country)) &&
    (expect(page).to have_selector(@signup_page.postcode)) &&
    (expect(page).to have_selector(@signup_page.country)) &&
    (expect(page).to have_selector(@signup_page.find_address_link)) &&
    (expect(page).to have_selector(@signup_page.enter_address_manually)) &&
    (expect(page).to have_selector(@signup_page.email_tickbox))
end

Then(/^I should be given a drop down list of options to select from$/) do
  expect(page).to have_selector(@signup_page.choose_address_input)
end




And(/^the following fields should appear$/) do |table|
  # table is a table.hashes.keys # => [:Fields]
  (expect(page).to have_selector(@signup_page.address1))&&
    (expect(page).to have_selector(@signup_page.address2)) &&
    (expect(page).to have_selector(@signup_page.town)) &&
    (expect(page).to have_selector(@signup_page.billing_address_count))
end

And(/^I select my address from dropdown$/) do
  @signup_page.select_address_from_dropdown
end