require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^I am on the home page$/ do
  visit root_path
end

Then /^show me the page$/ do
  save_and_open_page
end

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

Then /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I click "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should see "([^"]*)"$/ do |message|
    page.should have_content(message)
end


