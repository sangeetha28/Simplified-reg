require 'site_prism'
require 'rspec/expectations'
class Registration < SitePrism::Page
  include Capybara::DSL

  attr_reader :random_name

  section :sign_up_form, Registration, '#content'

  element :email_field, '#user_email'
  element :email_confirmation_field, '#user_email_confirmation'
  element :first_name_field, '#user_first_name'
  element :last_name_field, '#user_last_name'
  element :telephone_field, '#user_telephone'
  element :password_field, '#user_password'
  element :password_confirm_field, '#user_password_confirmation'
  element :postcode_field, '#user_default_billing_address_attributes_post_code'
  element :find_address_link, '.find_address_button.button.secondary.medium'
  element :choose_address_input, '.choose_address_input'
  element :billing_address_country, '#user_default_billing_address_attributes_county'
  element :submit_button, '.primary.button.large'
  element :registered_user, '.title.my_account_link.mobile_hide'
  element :continue_button, '#button_continue'
  element :add_address, '#add_address_button'
  element :guest_user_postcode_field,"#address_new_address_post_code"
  elements :user_name_display, ".your_details_more_info.summary_info>li"


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
    end
  end

  def enter_user_details
    random_name
    email_field.set "#{@random_name}+@sharklasers.com"
    email_confirmation_field.set "#{@random_name}+@sharklasers.com"
    first_name_field.set "First#{@random_name}"
    last_name_field.set "Last#{@random_name}"
    password_field.set "password"
    password_confirm_field.set "password"
    postcode_field.set "TW9 2NQ"
    find_address_link.click
    choose_address_input.select("Anthony Roberts Estate Agents, 3 Kew Road, Richmond")
  end

  def enter_guest_user_details
    random_name
    email_field.set "#{@random_name}+@sharklasers.com"
    email_confirmation_field.set "#{@random_name}+@sharklasers.com"
    first_name_field.set "First#{@random_name}"
    last_name_field.set "Last#{@random_name}"
    password_field.set "password"
    password_confirm_field.set "password"
  end

  def enter_address_details
    guest_user_postcode_field.set "TW9 2NQ"
    find_address_link.click
    choose_address_input.select("Anthony Roberts Estate Agents, 3 Kew Road, Richmond")
  end
end
