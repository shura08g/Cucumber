Before do |scenario|
  puts "Starting scenario #{scenario.name}"
end

After do |scenario|
  puts "Oh dear" if scenario.failed?
end

Around do |scenario, block|
  puts "About to run #{scenario.name}"
  block.call
  puts "Finished running #{scenario.name}"
end

#Example
Around('@run_with_and_without_javascript') do |scenario, block|
  Capybara.current_driver = Capybara.javascript_driver
  puts "with javascript"
  block.call
  puts "Finish with javascript!"
  Capybara.use_default_driver
  puts "without javascript"
  block.call
  puts "Finish without javascript!"
end

at_exit { #do
  puts "Googbye!!!"
  #exit
} #end
#If you want to run code after all of your features have finished, you can use
#Ruby’s built-in at_exit hook, which will be run just before the Cucumber process
#exits