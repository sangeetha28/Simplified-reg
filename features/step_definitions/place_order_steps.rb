
And(/^I add the product in my basket$/) do
  @add_to_basket=AddToBasket.new
  @add_to_basket.add_the_product_in_basket
end