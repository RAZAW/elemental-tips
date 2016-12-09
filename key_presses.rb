#filename: key_presses.rb

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup

@driver = Selenium::WebDriver.for :firefox

end

def teardown

	@driver.quit

end

def run

	setup
	yield
	teardown

end

run do

	@driver.get 'http://the-internet.herokuapp.com/key_presses'
	@driver.find_element(class: 'example').send_keys :space
	key_result = @driver.find_element(id: 'result').text
	expect(key_result).to eql ('You entered: SPACE')

end

run do

	@driver.get 'http://the-internet.herokuapp.com/key_presses'
	@driver.action.send_keys(:tab).perform
	shortcut_result = @driver.find_element(id: 'result').text
	expect(shortcut_result).to eql ('You entered: TAB')
end


	





