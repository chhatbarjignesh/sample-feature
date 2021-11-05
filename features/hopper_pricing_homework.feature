@hopper @hopper_hotel_pricing
Feature: As a User I want to test the Hopper AppX application for hotel pricing


# Book a hotel using the map. Add a guest, Add a card
  Background: Setup pre condition for this feature
    Given I set the data in dashboard for "daily markup excluding taxes fees usd" as "6.64"
      And I set the data in dashboard for "net rate exclusive of taxes" as "131.57"
      And I get the data from dashboard for
        | advertised_discount                       |
        | daily_markup_excluding_taxes_fees_usd     |
        | daily_net_rate_excluding_taxes_fees_usd   |
        | markup_percentage                         |
      And I am on the "exclusive last minute deals" screen in hopper app
      And I select "hotel" from the "list"
      


  @hopper_hotel_pricing_01
  Scenario: Verify that scratch out price is matching with the first comparable price
    Then I verify "first comparable" is matching with "scratch out pricing"


  @hopper_hotel_pricing_02
  Scenario: Verify that the ci hotel tapped enter booking flow has a daily markup excluding taxes fees same as markup from cover    
    When I select "view rooms"
    Then I verify "first rate on room" is matching with "scratch out pricing" in "app"
      And I verify "daily markup excluding taxes fees" is matching with "mark up from cover" in "dashboard"
      And I select "best available rate" from the "room screen"
      And I verify "daily markup excluding taxes fees" is matching with "daily_markup_excluding_taxes_fees_usd" in "dashboard"
      And I select "different room type" from the "room screen"
      And I verify "daily markup excluding taxes fees" is matching with "daily_markup_equation" in "dashboard"
      And I click on "continue" to checkout screen
      And I verify "daily markup excluding taxes fees" is matching with "daily_markup_equation" in "dashboard" 
      And I make the payment
      And I verify "daily markup excluding taxes fees" is matching with "daily_markup_equation" in "dashboard" 