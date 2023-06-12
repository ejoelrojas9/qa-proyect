require 'webdrivers/chromedriver'
require 'byebug'
require_relative ('../login_info.rb')

describe "Given good credentials" do
  it "should login" do
    puts "\n\e[1;34m\e[47m -Running fail login \e[m\n\n"
    # Open @browser
    @browser = Selenium::WebDriver.for :chrome
    @browser.manage.window.maximize
    # Navigate to url
    @browser.navigate.to ($url)
    # Enter email
    @browser.find_element(id: 'admin_email').send_keys($fail_email)
    # Enter password
    @browser.find_element(id: 'admin_password').send_keys($fail_password)
    # Click on login button
    @browser.find_element(name: 'commit').click
    # Check if success message is displayed
    $wait.until{@browser.find_element(css: '.bg-danger.text-white').displayed?}
    expect(@browser.find_element(css: '.bg-danger.text-white').text).to include($fail_login_message)
    # Close @browser
    sleep(2)
    @browser.quit
    puts "Finished test"
  end
end