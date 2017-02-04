Feature: Sample Feature

  @automated @sample_1
  Scenario: Choose a number
   Given I am on WelcomeScreen
   And I type "1234" in WelcomeScreen.inputField
   And I tap on WelcomeScreen.checkButton
   Then I see "Your value is an integer:1234" text
   And the color in WelcomeScreen.resultLabel is green

  @automated @sample_2
  Scenario: Choose a string
    Given I am on WelcomeScreen
    And I type "This is a string" in WelcomeScreen.inputField
    And I tap on WelcomeScreen.checkButton
    Then I see "This is a string - is not an integer" text
    And the color in WelcomeScreen.resultLabel is red

  @automated @sample_3
  Scenario: Evaluate a empty string
    Given I am on WelcomeScreen
    And I tap on WelcomeScreen.checkButton
    Then I see "Entry field is empty" text
    And the color in WelcomeScreen.resultLabel is yellow