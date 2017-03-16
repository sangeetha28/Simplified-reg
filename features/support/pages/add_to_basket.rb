require 'site_prism'

class AddToBasket < SitePrism::Page
  include Capybara::DSL

  elements :proceed_to_checkout, '.button.primary.medium.proceed_to_checkout_button'
  element :add_to_basket_button, '#add_to_cart'
  element :checkout_button, '.button.large.primary.checkout'
  element :continue_button, '#button_new_customer'
  element :triangel_toggle, '.toggle_triangle'
  elements :modals, '.modal'
  element  :close,'.fancybox-item.fancybox-close'
  def add_the_product_in_basket
    add_to_basket_button.click
    checkout_button.click
    #proceed_to_checkout.first.click
    #continue_button.click
  end

  def click_on_totaltriangal
    triangel_toggle.click
  end

  def click_on_delivery_info
    modals.first.click
  end

  def click_on_return_refund
    modals.last.click
  end

  def close_info
    close.click
  end

end

