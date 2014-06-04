Feature: See all recent posted talks
  As a visitor
  I want to see all recently posted talks
  So that I can learn about the latest awesomeness in meteor.js

  Scenario: See a talk
    Given a talk exists with a youtube id "q9pA2xApdY0"
    When I visit the homepage
    Then I should see a title "Sacha Greif: Introduction to Meteor -- April Devshop SF"
