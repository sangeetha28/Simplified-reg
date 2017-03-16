Feature: Remove address field sets
  As a customer
  I want a simple registration process
  So that I can quickly complete a purchase providing relevant information

  Background:
    Given I am on Home page

  @3.01
  Scenario:  No address fields in Registration form via header
    When I click on Register
    And I enter in my details in sign up form
    Then the Registration page should NOT have included a address field
    And I click Submit button
    Then I should register successfully
    And I navigate to My accounts page
    And I should be taken to My details page
    Then the My accounts page should NOT have included a address field

  @3.02
  Scenario: No address fields in Registration form via header via favourites
    When I click on Favourites
    Then I should see Your Favourites
    When I click on REGISTER
    And I enter in my details in sign up form
    Then the Registration page should NOT have included a address field
    And I click Submit button
    Then I should register successfully
    And I navigate to My accounts page
    And I should be taken to My details page
    Then the My accounts page should NOT have included a address field

  @3.03
  Scenario: No address fields in Registration form via checkout
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field

  @3.04
  Scenario: Validate error message via Submit button without postcode
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field
    And I click Continue button
    And I should be directed to checkout/your_order page with the following fields
      | name     | mandatory |
      | country  | mandatory |
      | postcode | mandatory |
    And name fields should be pre-populated with first name and last name from previous page
    And I should be able to edit first and last name by clicking on 'Change Name'
    And country should be defaulted to United Kingdom
    And I click Continue button
    Then I should get following error messages
      | error_messages              |
      | Please enter your postcode. |

  @3.05
  Scenario: Validate error message via Find Address without postcode
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field
    And I click Continue button
    And I should be directed to checkout/your_order page with the following fields
      | name     | mandatory |
      | country  | mandatory |
      | postcode | mandatory |
    And name fields should be pre-populated with first name and last name from previous page
    And country should be defaulted to United Kingdom
    And I click Find Address button
    Then I should get following error messages
      | error_messages              |
      | Please enter your postcode. |

  @3.06
  Scenario: Address fields via Find Address
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field
    And I click Continue button
    And I should be directed to checkout/your_order page with the following fields
      | name     | mandatory |
      | country  | mandatory |
      | postcode | mandatory |
    And name fields should be pre-populated with first name and last name from previous page
    And country should be defaulted to United Kingdom
    And I should be given the option to FIND ADDRESS automatically
    And I should be given the option to ENTER ADDRESS MANUALLY
    And I provide my postcode
    And I click Find Address button
    Then the following fields should appear
      | Fields    |
      | Address 1 |
      | Address 2 |
      | Town/City |
      | County    |

  @3.07
  Scenario: Address fields via enter address manually
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field
    And I click Continue button
    And I should be directed to checkout/your_order page with the following fields
      | name     | mandatory |
      | country  | mandatory |
      | postcode | mandatory |
    And name fields should be pre-populated with first name and last name from previous page
    And country should be defaulted to United Kingdom
    And I should be given the option to FIND ADDRESS automatically
    And I should be given the option to ENTER ADDRESS MANUALLY
    And I click enter address manually button
    Then the following fields should appear
      | Fields    |
      | Address 1 |
      | Address 2 |
      | Town/City |
      | County    |


  @3.08
  Scenario: Delivery options should be updated if the country is updated
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field
    And I click Continue button
    And I should be directed to checkout/your_order page with the following fields
      | name     | mandatory |
      | country  | mandatory |
      | postcode | mandatory |
    And name fields should be pre-populated with first name and last name from previous page
    And country should be defaulted to United Kingdom
    And I should be able to edit the country
    Then if I edit the country the delivery options should update


  @3.09
  Scenario: Change first name & last name and save changes
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field
    And I click Continue button
    And I should be directed to checkout/your_order page with the following fields
      | name     | mandatory |
      | country  | mandatory |
      | postcode | mandatory |
    And name fields should be pre-populated with first name and last name from previous page
    And I should be able to edit first and last name by clicking on 'Change Name'
    And I provide my postcode
    And I select an address
    And I click on Continue button
    Then I should be successfully navigated to the next page with changed first name and last name


  @3.10
  Scenario: Address fields via Find Address
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field
    And I click Continue button
    And I should be directed to checkout/your_order page with the following fields
      | name     | mandatory |
      | country  | mandatory |
      | postcode | mandatory |
    And name fields should be pre-populated with first name and last name from previous page
    And country should be defaulted to United Kingdom
    And I should be given the option to FIND ADDRESS automatically
    And I should be given the option to ENTER ADDRESS MANUALLY
    And I provide my postcode as SW14 7DN
    And I click on Find Address button
    Then I should be given a drop down list of options to select from
    And the following fields should appear
      | Fields    |
      | Address 1 |
      | Address 2 |
      | Town/City |
      | County    |
    And the address fields should be prepopulated with address values.



  @3.11
  Scenario: Address fields via Find Address
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field
    And I click Continue button
    And I should be directed to checkout/your_order page with the following fields
      | name     | mandatory |
      | country  | mandatory |
      | postcode | mandatory |
    And name fields should be pre-populated with first name and last name from previous page
    And country should be defaulted to United Kingdom
    And I should be given the option to FIND ADDRESS automatically
    And I should be given the option to ENTER ADDRESS MANUALLY
    And I provide my postcode
    And I click Enter address manually button
    Then the following fields should appear
      | Fields    |
      | Address 1 |
      | Address 2 |
      | Town/City |
      | County    |


  @3.05
  Scenario:
    And I register as a new user
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    When I enter my email and password and click SIGN IN
    And I click Continue button
    And I enter in my address details
    And I should be given the option to FIND ADDRESS automatically
    And I should be given the option to ENTER ADDRESS MANUALLY
    And If I use FIND ADDRESS I should be able to manually edit each of the fields

  @3.06
  Scenario: Address fields in Registration form via checkout
    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
    And I add the product in my basket
    And I enter in my details as a guest
    Then the Registration page should NOT have included a address field
    And I click Continue button
    And I enter in my address details
    And I should be given the option to FIND ADDRESS automatically
    And I should be given the option to ENTER ADDRESS MANUALLY
    And If I use FIND ADDRESS I should be able to manually edit each of the fields






#
#  @3.04
#  Scenario: Registration through checkout
#    And I navigate to /willbishopjewellerydesign/product/bumble-bee-brooch product detail page
#    And I add the product in my basket
#    And I enter in my details as a guest
#    And I click Continue button
#  I should be directed to a delivery address form with the following fields
#  name	mandatory?
#  country	mandatory
#  post code	mandatory
#    And I should be given the option to FIND ADDRESS automatically
#    And I should be given the option to ENTER ADDRESS MANUALLY
#    And If I use FIND ADDRESS I should be able to manually edit each of the fields
#
#
#  Scenario - account created without address
#    Given I have an account
#    And I have not added an address to my account
#    And on the basekt page I click on PROCEED TO CHECKOUT
#    When I enter my email and password and click SIGN IN
#  I should be directed to a delivery address form with the following fields
#  field	mandatory?
#  country	mandatory
#  post code	mandatory
#    And I should be given the option to FIND ADDRESS automatically
#    And I should be given the option to ENTER ADDRESS MANUALLY
#    And If I use FIND ADDRESS I should be able to manually edit each of the fields
#
#
#  Scenario - re-purchase
#    Given I have an account
#    And I have added a delivery and billing address
#    When I sign in through checkout OR when I click PROCEED TO CHECKOUT
#    Then I should be directed to /checkout/your_order
#  no delivery screen
#  no changes to payment screen