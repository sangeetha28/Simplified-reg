
And(/^I add the product in my basket$/) do
  @add_to_basket=AddToBasket.new
  @add_to_basket.add_the_product_in_basket
end

And(/^I navigate to checkout$/) do
  @add_to_basket.click_on_checkout_button
  sleep(10)
  save_screenshot("basket_page.png")
end

And(/^I personalize my product$/) do
  @product_details=ProductDetails.new
  @product_details.personalise_my_product
end


And(/^I click customization option$/) do
  @product_cards= ProductCards.new
  @product_cards.click_customization_option
  save_screenshot("CustomizationOptions.png")
end


And(/^I (.*) quantity$/) do |option|
  if option == "increment"
    @product_cards.increment_quantity
    @product_cards.increment_quantity
    @product_cards.increment_quantity
    @product_cards.increment_quantity
    @product_cards.increment_quantity
    save_screenshot("AfterIncrement.png")
  else
    @product_cards.decrement_quantity
    @product_cards.decrement_quantity
    save_screenshot("Afterdecrement.png")
  end
end

And(/^I (.*) my option$/) do |option|
  if option == "hide"
  @product_cards.hide_option
  save_screenshot("Hide_Custom_option.png")
  else
    @product_cards.edit_option
    save_screenshot("edit_option.png")
    end
end

And(/^I change my personalization$/) do
  @product_details.change_personalise_product
end


And(/^I click product link$/) do
  @product_cards.click_product_link
  save_screenshot("Product Page.png")
end


And(/^I change part of personalization$/) do
  @product_cards.change_single_field
end

