Feature: Login

	Scenario: Successful login with PIN
		Given I have pushed my card in the slot
		When I enter my PIN
		And I press "OK"
		Then I should see the main menu
		
	Scenario: Successful login with PIN short
		Given I have authenticated with the correct PIN