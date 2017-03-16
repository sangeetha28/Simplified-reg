Feature: Basketpage total
  As a customer
  I want a clear breakdown of the total price of my order
  So that I make an informed purchase


  @5.01
  Scenario: Basket bar total in Top of Page
    Given I am on Home page
    #And I register as a new user
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket



#    Then I should be able to see a Total which should be collapsed by default
#    And I should be able to expand the Total to reveal
#      | items |   |
#      | estimated_delivery| |
#    And when I expand the Total the content on the page should be pushed down
#    And the arrow next to the Total should animate downwards
#    And I should be able to collapse the Total


  @5.02
  Scenario: Basket bar total in bottom of Page
#  Then I should be able to see a Total which should reveal
#    | items |   |
#    | estimated_delivery| |
