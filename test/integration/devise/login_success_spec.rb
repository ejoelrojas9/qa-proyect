require 'webdrivers/chromedriver'
require_relative ('../login_info.rb')

describe 'Login successfully' do
  it "Should do login" do
    @browser = Selenium::WebDriver.for :chrome
    @browser.manage.window.maximize
    @browser.navigate.to ($url)
    @browser.find_element(id: 'admin_email').send_keys($email)
    @browser.find_element(id: 'admin_password').send_keys($password)
    @browser.find_element(name: 'commit').click
    $wait.until{@browser.find_element(css: '.alert-alert').displayed?}
    expect(@browser.find_element(css: '.alert-alert').text).to include($success_login_message)
    @browser.quit
    puts "Login successfully"
  end
end
