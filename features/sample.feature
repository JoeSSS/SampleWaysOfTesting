Feature: Sample Feature

  @ios @android @sample_1
  Scenario Outline: Choose a number
   Given I am on WelcomeScreen
   And I type "<text>" in WelcomeScreen.inputField
   And I tap on WelcomeScreen.checkButton
   Then I see "<result>" text
   And the color in WelcomeScreen.resultLabel is <color>
    Examples:
   | text             |  result                               | color   |
   | 1234             | Your value is an integer:1234         |  green  |
   | This is a string | This is a string - is not an integer  |  red    |
   |                  | Entry field is empty                  |  yellow |

  @ios @android @sample_2
  Scenario: Choose a string
    Given I am on WelcomeScreen
    And I type "This is a string" in WelcomeScreen.inputField
    And I tap on WelcomeScreen.checkButton
    Then I see "This is a string - is not an integer" text
    And the color in WelcomeScreen.resultLabel is red

  @ios @android @sample_3
  Scenario: Evaluate a empty string
    Given I am on WelcomeScreen
    And I tap on WelcomeScreen.checkButton
    Then I see "Entry field is empty" text
    And the color in WelcomeScreen.resultLabel is yellow


  @android @sample_backdoor_1
  Scenario: Check the Empty Entry using backdoor (no clicking and typing text)
    Given I am on WelcomeScreen
    And I change the color to be "red"
    And the color in WelcomeScreen.resultLabel is red
    And I change the color to be "yellow"
    And the color in WelcomeScreen.resultLabel is yellow
    And I change the color to be "green"
    And the color in WelcomeScreen.resultLabel is green