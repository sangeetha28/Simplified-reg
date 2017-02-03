Feature: Remove title field
  As a customer
  I want to only provide relevant information
  So that I can ensure a level of privacy and data protection

  Background:
     Given I am on Home page

  @1.01
  Scenario: Title field should not be displayed in Registration form
    When I click on Register
    And I enter in my details in sign up form
    Then the Registration page should NOT include a title field
    And I click Submit button
    Then I should register successfully
    Then the My accounts page should NOT include a title field

  @1.02
  Scenario: Title field should not be displayed in Registration form via favourites
    When I click on Favourites
    Then I should see Your Favourites
    When I click on REGISTER
    And I enter in my details in sign up form
    Then the Registration page should NOT include a title field
    And I click Submit button
    Then I should register successfully
    Then the My accounts page should NOT include a title field

  @s1.03
  Scenario: Title field should not be displayed in Registration form via checkout process
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT include a title field
    And I click Continue button
    And I enter in my address details
    Then I should not see title with my user name
    And I click Add address button
    Then I should not see title with my user name
