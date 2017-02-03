require 'site_prism'

class HomePage < SitePrism::Page
  include Capybara::DSL

  element :register_button, ".register_link.last.button_medium_mobile"
  element :favourite_button, "#favourites_heart_inactive"
  element :favourite_header_text, ".favourites_intro_header"
  element :favourite_register_button, "#favourites-list-register"
  element :continue_as_new_customer, "#button_new_customer"
  element :my_account, ".account_area_link_item.first>a"


  def navigate(link=nil)
      visit("#{link}")
  end

  def click_on(button_name)
    case button_name
      when 'Register'
        register_button.click
      when 'Favourites'
        favourite_button.click
      when 'REGISTER'
        favourite_register_button.click
      when 'Continue'
        continue_as_new_customer.click
    end
  end
end


