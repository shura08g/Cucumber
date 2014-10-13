Given(/^I have pushed my card in the slot$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter my PIN$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I press "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the main menu$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have authenticated with the correct PIN$/) do
  steps %{
	And I have pushed my card in the slot
	And I enter my PIN
	And I press "OK"
  }
end

Given /^an activated customer (\w+) exists$/ do |name|
  steps %{
	Given I create a customer with login #{name}
	And I register the customer with login #{name}
	And I activate the customer with login #{name}
  }
end
