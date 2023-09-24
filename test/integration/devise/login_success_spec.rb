require 'webdrivers/chromedriver'
require_relative ('../login_info.rb')

describe "Given good credentials" do
  it "Should login" do
    explorer = Selenium::WebDriver.for :chrome
    explorer.navigate.to ($url)
    explorer.find_element(id: 'admin_email').send_keys("test@example.com")
    explorer.find_element(id: 'admin_password').send_keys("test0102.")
    explorer.find_element(name: 'commit').click
    $wait.until{explorer.find_element(css: '.alert-alert').displayed?}
    expect(explorer.find_element(css: '.alert-alert').text).to include("Signed in successfully.")
    explorer.quit
    puts "Test finished"  
  end
  
end
