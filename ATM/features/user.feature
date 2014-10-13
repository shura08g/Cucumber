Feature: test User
	Using Data tables
	
	Scenario: Without Data tables
		Given a User "Michael Jackson" born on August 29, 1958
		And a User "Elvis" born on January 8, 1935
		And a User "John Lennon" born on October 9, 1940
		
	Scenario: Using Data tables
		Given these Users:
			| name            | date of birth   |
			| Michael Jackson | August 29, 1958 |
			| Elvis           | January 8, 1935 |
			| John Lennon     | October 9, 1940 |