Feature: Remove contact number
  As a customer
  I want the option to include my phone number
  So that I can provide the delivery services with my number to facilitate delivery

  Background:
    Given I am on Home page

  @2.01
  Scenario: Customer should not see remove contact number in registration form
    When I click on Register
    And I enter in my details in sign up form
    Then the Registration page should Not have included a contact number field
    And I click Submit button
    Then I should register successfully
    And I navigate to My accounts page
    Then the My accounts page should Have included a contact number field

  @2.02
  Scenario: Customer should not see remove contact number in registration form
    When I click on Favourites
    Then I should see Your Favourites
    When I click on Register
    And I enter in my details in sign up form
    Then the Registration page should Not have included a contact number field
    And I click Submit button
    Then I should register successfully
    And I navigate to My accounts page
    Then the My accounts page should Have included a contact number field


  @2.03
  Scenario: Customer should see contact number field in checkout process
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should have included a contact number field
    And I click Continue button
    And I enter in my address details


    #Notes
    #if adding phone as part of check out only show phone field if partner supports phone tracking