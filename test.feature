# cucumber test.feature --dry-run

Feature: This is the feature title
	This is the description of the feature, which can
	span multiple lines.
	You can even include empty lines, like this one:
	
	In fact, everything until the next Gherkin keyword is included
	in the description.

	Scenario: Successful withdrawal from an account in credit
		Given I have $100 in my account # the context
		When I request $20              # the event(s)
		Then $20 should be dispensed    # the outcome(s)
		
	Scenario: Attempt withdrawal using stolen card
		Given I have $100 in my account
		But my card is invalid
		When I request $50
		Then my card should not be returned
		And I should be told to contact the bank

# without And or But		
	Scenario: Attempt withdrawal using stolen card
		Given I have $100 in my account
		Given my card is invalid
		When I request $50
		Then my card should not be returned
		Then I should be told to contact the bank

# with *		
	Scenario: Attempt withdrawal using stolen card
		* I have $100 in my account
		* my card is invalid
		* I request $50
		* my card should not be returned
		* I should be told to contact the bank