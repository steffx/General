Given(/^I log in to "([^"]*)"$/) do |arg|
@browser = Selenium::WebDriver.for (:chrome)
  @browser.navigate.to ('https://team007qa.slack.com')
end

And(/^I type "([^"]*)" in the email field$/) do |arg|
  sleep 1
 # @browser.switch_to.default_content
   @browser.find_element(:id, "email").send_keys arg
end

And(/^I type "([^"]*)" in the password field$/) do |arg|
  @browser.find_element(:id, "password").send_keys arg
end

And(/^I click the Sign in button$/) do
  @browser.find_element(:id, 'signin_btn').click
  #sleep 4
  end

Then(/^I should be logged in$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  input = wait.until {
    element = @browser.find_element(:id, 'team_name')
    element if element.displayed?
  }
  match = 'QA team'
  expect(@browser.find_element(:id,'team_name').text).to be == match
  puts "The name of the team : "  + "\"" + "#{match}" + "\""  " is found" if input.displayed?

   wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  input = wait.until {
    element = @browser.find_element(:id, 'current_user_name')
    element if element.displayed?
      }
  match2 = 'stefan'
  expect(@browser.find_element(:id,'current_user_name').text).to be == match2
  puts "Current user name is : "  + "\"" + "#{match2}" + "\"" if input.displayed?
end


And(/^I should sign out$/) do
  @browser.find_element(:xpath,"//div[@class = 'ts_icon ts_icon_chevron_large_down']" ).click
 @browser.find_element(:xpath, "//li[@id = 'logout']").click
end