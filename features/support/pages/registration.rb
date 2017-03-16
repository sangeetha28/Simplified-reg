require 'site_prism'
require 'rspec/expectations'
class Registration < SitePrism::Page
  include Capybara::DSL


  section :sign_up_form, Registration, '#content'

  element :email_field, '#user_email'
  element :email_confirmation_field, '#user_email_confirmation'
  element :first_name_field, '#user_first_name'
  element :last_name_field, '#user_last_name'
  element :telephone_field, '#user_telephone'
  element :password_field, '#user_password'
  element :password_confirm_field, '#user_password_confirmation'
  element :postcode_field, '#user_default_billing_address_attributes_post_code'


  element :country, '#address_new_address_country'
  element :postcode, '#address_new_address_post_code'
  element :find_address_link, '.find_address_button.button.secondary.medium'
  element :choose_address_input, '.choose_address_input'
  element :address1, '#user_default_billing_address_attributes_address1'
  element :address2, '#user_default_billing_address_attributes_address2'
  element :town, '#user_default_billing_address_attributes_town'
  element :billing_address_county, '#user_default_billing_address_attributes_county'
  element :enter_address_manually, '.manual_entry_link.medium'
  element :email_tickbox, '#communication_preference_accepts_email'


  element :check_yourorder_errmsg, ".validate-error.inline-errors.required.last"

  element :submit_button, '.primary.button.large'
  element :registered_user, '.title.my_account_link.mobile_hide'
  element :continue_button, '#button_continue'
  element :add_address, '#add_address_button'
  element :guest_user_postcode_field, "#address_new_address_post_code"
  elements :user_name_display, ".your_details_more_info.summary_info>li"

  #My Details page
  element :my_details_page, ".page_title"


  element :existing_customer_signin, "#button_existing_customer"

  #need to remove this
  element :title, "#user_title"


  def enter_address_manually
    address_manual.click
    address1.set "Flat"
    address2.set "49 Kew Road"
    town.set "Richmond"
  end

  def random_name
    @random_name||= Time.now.to_i
  end

  def click_on_button(button_name)
    case button_name
      when 'Submit'
        submit_button.click
      when 'Continue'
        continue_button.click
      when 'Add address'
        add_address.click
      when 'Find Address'
        find_address_link.click
      when 'Enter address manually'
        enter_address_manually.click

    end
  end


  def select_address_from_dropdown
    choose_address_input.select("Anthony Roberts Estate Agents, 3 Kew Road, Richmond")
  end

  def enter_user_details
    random_name
    @email_address = "#{@random_name}+@sharklasers.com"
    email_field.set "#{@random_name}+@sharklasers.com"
    email_confirmation_field.set "#{@random_name}+@sharklasers.com"
    #select('mr', :from => 'user_title')
    first_name_field.set "First#{@random_name}"
    last_name_field.set "Last#{@random_name}"
    @password = "password"
    password_field.set "password"
    password_confirm_field.set "password"
    postcode_field.set "TW9 2NQ"
    find_address_link.click
    choose_address_input.select("Anthony Roberts Estate Agents, 3 Kew Road, Richmond")
  end

  def enter_guest_user_details
    random_name
    @email_address="#{@random_name}+@sharklasers.com"
    email_field.set "#{@random_name}+@sharklasers.com"
    email_confirmation_field.set "#{@random_name}+@sharklasers.com"
    #select('mr', :from => 'user_title')
    first_name_field.set "First#{@random_name}"
    last_name_field.set "Last#{@random_name}"
    @password = "password"
    password_field.set "password"
    password_confirm_field.set "password"
  end

  def enter_address_details
    guest_user_postcode_field.set "TW9 2NQ"
    find_address_link.click
    choose_address_input.select("Anthony Roberts Estate Agents, 3 Kew Road, Richmond")
  end

  def signin_as_existinguser
    existing_customer_signin.click
    email_field.set @email_address
    password_field.set @password
  end

  def navigate_to_myaccounts
    registered_user.click
  end
end
