require 'site_prism'

class AddToBasket < SitePrism::Page
  include Capybara::DSL

  elements :proceed_to_checkout, '.button.primary.medium.proceed_to_checkout_button'
  element :add_to_basket_button, '#add_to_cart'
  element :checkout_button, '.button.large.primary.checkout'
  element :continue_button, '#button_new_customer'

  def add_the_product_in_basket
    add_to_basket_button.click
    checkout_button.click
    proceed_to_checkout.first.click
    continue_button.click
  end
end

