require 'rspec'

class Account
  #def initialize(amount)
  #end
  def deposit(amount)
    @balance = amount
  end
  
  def balance
    @balance
  end
end

class Teller
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end
  def withdraw_from(account, amount)
    @cash_slot.dispense(amount)
  end
end

class CashSlot
  def contents
    @contents or raise("I'm empty!")
  end
  def dispense(amount)
    @contents = amount
  end
end

module KnowsTheDomain
  def my_account
    @my_account ||= Account.new
  end
  
  def cash_slot
    @cash_slot ||= CashSlot.new
  end
  
  def teller
    @teller ||= Teller.new(cash_slot)
  end
end

World(KnowsTheDomain)

CAPTURE_A_NUMBER = Transform (/^\d+$/) do |number|
  number.to_i
end

CAPTURE_CASH_AMOUNT = Transform (/^\$(\d+)$/) do |digits|
  digits.to_i
end

#Transform /^(£|\$|€)(\d+)$/ do |currency_symbol, digits|
#  Currency::Money.new(digits, currency_symbol)
#end

#Given(/^I have deposited \$(\d+) in my account$/) do |amount|
#Given(/^I have deposited \$(#{CAPTURE_A_NUMBER}) in my account$/) do |amount|
Given(/^I have deposited (#{CAPTURE_CASH_AMOUNT}) in my account$/) do |amount|
  #Account.new(amount.to_i)
  my_account.deposit(amount)
  my_account.balance.should eq(amount), 
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When(/^I withdraw (#{CAPTURE_CASH_AMOUNT})$/) do |amount|
  teller.withdraw_from(my_account, amount)
end

Then(/^(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/) do |amount|
  cash_slot.contents.should == amount
  #x = ask("How money you withdraw?", 60)
  #cash_slot.contents.should == x.to_i
end
