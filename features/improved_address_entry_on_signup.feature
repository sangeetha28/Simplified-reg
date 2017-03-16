Feature: Improved address entry
  As a customer
  I want a simple registration process
  So that I can quickly complete a purchase providing relevant information
  Acceptance Criteria

  Background:
    Given I am on Home page

  @4.01
  Scenario: Sign up form via header( Find Address )
    When I click Register button
    Then I should be directed to a sign up form with the following mandatory fields:
      | fieldnames                  |
      | First Name                  |
      | Last Name                   |
      | Email                       |
      | Confirm email               |
      | Password                    |
      | Confirm Password            |
      | Phone Number                |
      | Country                     |
      | postcode                    |
      | find address button         |
      | enter manually button       |
      | Email subscription tick box |
    And I enter in my details in sign up form
    When I click Find Address button
    Then I should be given a drop down list of options to select from
    And I select my address from dropdown
    And the following fields should appear
      | Fields    |
      | Address 1 |
      | Address 2 |
      | Town/City |
      | County    |


  @4.02
  Scenario: Sign up form via header ( Enter Address Manually )
    When I click Register button
    Then I should be directed to a sign up form with the following mandatory fields:
      | fieldnames                  |
      | First Name                  |
      | Last Name                   |
      | Email                       |
      | Confirm email               |
      | Password                    |
      | Confirm Password            |
      | Phone Number                |
      | Country                     |
      | postcode                    |
      | find address button         |
      | enter manually button       |
      | Email subscription tick box |
    When I click Enter Address Manually button
    And the following fields should appear
      | Fields    |
      | Address 1 |
      | Address 2 |
      | Town/City |
      | County    |



  @4.03
  Scenario: Sign up form via favourites ( Find Address )
    When I click on Favourites button
    And I click on Register button
    Then I should be directed to a sign up form with the following mandatory fields:
      | fieldnames                  |
      | First Name                  |
      | Last Name                   |
      | Email                       |
      | Confirm email               |
      | Password                    |
      | Confirm Password            |
      | Phone Number                |
      | Country                     |
      | postcode                    |
      | find address button         |
      | enter manually button       |
      | Email subscription tick box |
    When I click Find Address button
    Then I should be given a drop down list of options to select from
    And I select my address from dropdown
    Then I should be given a drop down list of options to select from
    And the following fields should appear
      | Fields    |
      | Address 1 |
      | Address 2 |
      | Town/City |
      | County    |


  @4.04
  Scenario: Sign up form via favourites (Enter Address Manually)
    When I click on Favourites button
    And I click on Register button
    Then I should be directed to a sign up form with the following mandatory fields:
      | fieldnames                  |
      | First Name                  |
      | Last Name                   |
      | Email                       |
      | Confirm email               |
      | Password                    |
      | Confirm Password            |
      | Phone Number                |
      | Country                     |
      | postcode                    |
      | find address button         |
      | enter manually button       |
      | Email subscription tick box |
    When I click Find Address button
    Then I should be given a drop down list of options to select from
    And I select my address from dropdown
    Then I should be given a drop down list of options to select from
    And the following fields should appear
      | Fields    |
      | Address 1 |
      | Address 2 |
      | Town/City |
      | County    |




  @4.03
  Scenario Outline: Sign up form via checkout
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    Then I should be directed to a sign up form with the following mandatory fields:
      | fieldnames                  |
      | First Name                  |
      | Last Name                   |
      | Email                       |
      | Confirm email               |
      | Password                    |
      | Confirm Password            |
      | Phone Number                |
      | Country                     |
      | postcode                    |
      | find address button         |
      | enter manually button       |
      | Email subscription tick box |
    When I click on <option> button
    Then I should be given a drop down list of options to select from
    And the following fields should appear
      | Fields    |
      | Address 1 |
      | Address 2 |
      | Town/City |
      | County    |
    Examples:
      | option                 |
      | Find Address           |
      | enter address manually |


#  Scenario Form Completed
#    Given I have signed up from [link]
#    And when I click on submit I should be redirected to [page] with [url]
#  link	page	url
#  header	previous page	?
#  favorites	favorites	/user/favorites
#  checkout	order completed	checkout/completed
#    And a user should be visible in the CMS
#    And I should receive a confirmation email to the email used to create the account
#
#  Scenario Form Incomplete
#    And if I click on submit without completing one or more fields
#    Then I should be shown an error message below each incomplete field (as per current implementation)
#    And I should not be able to submit the form
#    And a user should not be created in the CMS
#
#  Scenario Inconsistent email
#    And if I enter values in the email and confirm email fields that differ OR I complete the confirm email and leave the email field blank
#    When I click out of the confirm email field
#    Then I should be shown an inline validation message informing me the emails are inconsistent
#    And I should not be able to submit the form
#    And a user should not be created in the CMS
#
#  Scenario Inconsistent password
#    And if I enter values in the password and confirm password fields that differ OR I complete the confirm password and leave the password field blank
#    When I click out of the confirm password field
#    Then I should be shown an inline validation message informing me the passwords are inconsistent
#    And I should not be able to submit the form
#    And a user should not be created in the CMS