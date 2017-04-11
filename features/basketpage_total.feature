Feature: Basketpage total
  As a customer
  I want a clear breakdown of the total price of my order
  So that I make an informed purchase


  @5.01
  Scenario: Basket bar total in Top of Page
    Given I am on Home page
    And I navigate to /lisaangeljewellery/product/personalised-sterling-silver-bar-necklace product detail page
    And I personalize my product
    And I add the product in my basket
    And I navigate to checkout
#    And I click customization option
#    And I hide my option
#    And I click product link
#    And I change my personalization
#    And I add the product in my basket
#    And I click customization option
#    And I edit my option
#    And I change part of personalization
    And I increment quantity
    And I decrement quantity
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I navigate to checkout
    And I navigate to /artificiallandscapes/product/christmas-berries-and-blooms-hanging-basket product detail page
    And I add the product in my basket
    And I navigate to checkout
#    And I delete my option
#    And I navigate to checkout

