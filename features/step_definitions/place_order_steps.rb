
And(/^I add the product in my basket$/) do
  @add_to_basket=AddToBasket.new
  @add_to_basket.add_the_product_in_basket
  sleep(10)
  save_screenshot("Totalbar.png")
  @add_to_basket.click_on_totaltriangal
  page.execute_script "window.scroll(0,400)"
  save_screenshot("Bottom Totalbar.png")
  @add_to_basket.click_on_delivery_info
  sleep(5)
  save_screenshot("delivery_info1.png")
  page.execute_script "window.scroll(0,400)"
  save_screenshot("delivery_info2.png")
  @add_to_basket.close_info
  @add_to_basket.click_on_return_refund
  sleep(5)
  save_screenshot("Returns_and_refund1.png")
  page.execute_script "window.scroll(0,400)"
  save_screenshot("Returns_and_refund2.png")
end