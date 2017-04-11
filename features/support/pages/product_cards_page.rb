require 'site_prism'

class ProductCards < SitePrism::Page
  include Capybara::DSL
  element :customopt, ".toggle_trigger.product_card__customisation_link"
  elements :quantitycontrol, ".product_card__quantity_button"
  element :product_link, ".product_card__title>a"
  elements :hide, ".product_card__customisation_hide.toggle_trigger"
  element :edit_options, ".product_card__customisation_header>a"
  element :delete, ".product_card__remove_button>a"

  def click_customization_option
    customopt.click
  end

  def increment_quantity
    quantitycontrol[1].click
  end

  def decrement_quantity
    quantitycontrol[0].click
  end

  def click_product_link
    product_link.click
    sleep(10)
  end

  def hide_option
   hide[0].click
  end

  def edit_option
    edit_option.click
  end

  def delete_option
    delete_option.click
  end

  end