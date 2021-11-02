@hopper @hopper_hotel
Feature: As a User I want to test the Hopper AppX application for hotels


# Book a hotel using the map. Add a guest, Add a card
  @hopper_hotel_01 @logged_in @maps
  Scenario: Verify that user is able to book the hotel using map as by adding new guest and payment method
    Given I am on the "hotels" screen in hopper app with logged in "user" 
      And I enter destination as "chicago" and select dates as "11/4 - 11/5" and "select dates"
      And I "zoom in" masps to redo the search
      And I select "hotel" from the "map" and "view rooms"
    When I select "room" and add "guests"
      And I enter payment details as using "profile" and pay 
    Then I should see trip summary
      And I verfiy that email received as expected


# Enter hotel booking from signed out stay
  @hopper_hotel_02 @logged_out
  Scenario: Verify that user is able to book hotel from signed out state
    Given I am on the "hotels" screen in hopper app
      And I enter destination as "chicago" and select dates as "11/4 - 11/5" and "select dates"
      And I select "hotel" from the "list" and "view rooms"
    When I select "room" and continue
      And I signed in to the hopper app with "user"
    Then I verify that I am on the "view trip insurance" page
      And I select "trip insurance" and click on "continue"
      And I verify the guest as per the "user"


# filter for hotels
  @hopper_hotel_03 @filter
  Scenario Outline: Verify that user is able to sort and filter the hotels
    Given I am on the "hotels" screen in hopper app
      And I enter destination as "chicago" and select dates as "11/4 - 11/5" and "select dates"
    When I filter hotels by "<filter_name>"
      And I see correct results as per the "<filter_name>"

  Examples:
    | filter_name       | 
    | user_rating       |
    | hotel_star_rating |
    | price_range       |
    | amenities         |
    | locations         |

  # sort for hotels
  @hopper_hotel_04 @sort
  Scenario Outline: Verify that user is able to sort and filter the hotels
    Given I am on the "hotels" screen in hopper app
      And I enter destination as "chicago" and select dates as "11/4 - 11/5" and "select dates"
    When I filter hotels by "<sort_name>"
      And I see correct results as per the "<sort_name>"

  Examples:
    | sort_name         | 
    | most_recommended  |
    | star_rating       |
    | user_rating       |
    | price             |
    | savings           |   



