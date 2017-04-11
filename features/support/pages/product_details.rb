require 'site_prism'

class ProductDetails < SitePrism::Page
  include Capybara::DSL

  element :attr1, "#line_item_options_attributes_1_product_option_value_id_currency_GBP"
  element :attr2, "#line_item_options_attributes_2_product_option_value_id_currency_GBP"
  element :front, "#front_personalisation_c5a2c183b4924e9b26ed20c6881fff81d148b46a"
  element :left, "#left_personalisation_7a2f866393da3b5a9cbd15d26017fb96cf9a4230"
  element :back, "#back_personalisation_ac8247b559b0bbff5b04cc1caeecd5a95fd39dd8"
  element :right, "#right_personalisation_fc56d72f7a323b57ad7429a380700cdccf809895"
  element :attr7, "#line_item_options_attributes_7_product_option_value_id_currency_GBP"
  element :attr8, "#line_item_options_attributes_8_product_option_value_id_currency_GBP"
  element :attr9, "#line_item_options_attributes_9_product_option_value_id_currency_GBP"
  element :attr10, "#line_item_options_attributes_10_product_option_value_id_currency_GBP"


  def personalise_my_product
    attr1.select("Brushed - Hand-Stamped Silver Finish")
    attr2.select("4 sides")
    sleep(2)
    front.set "emily"
    left.set "kate"
    back.set "dave"
    right.set "danielle"
    attr7.select("Ball")
    attr8.select("40cm (16\")")
    attr9.select("No thanks")
    attr10.select("Little Paper Bag |S,U|")
  end

  def change_personalise_product
    attr1.select("Brushed - Hand-Stamped Silver Finish")
    attr2.select("4 sides")
    front.set "emily"
    left.set "kate"
    back.set "dave"
    right.set "daniellee"
    attr7.select("Ball")
    attr8.select("40cm (16\")")
    attr9.select("No thanks")
    attr10.select("Little Paper Bag |S,U|")
  end

  def change_single_field
    right.set "danielleex"
  end
end
