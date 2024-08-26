require 'webdrivers/chromedriver'
require_relative ('../login_info.rb')

describe "Should success login" do
  before(:all) do
    puts "\n\e[1;34m\e[47m -Running managers list \e[m\n\n"
    @browser = Selenium::WebDriver.for :chrome
    @browser.manage.window.maximize
    @browser.navigate.to ($url)
    @browser.find_element(id: 'admin_email').send_keys($email)
    @browser.find_element(id: 'admin_password').send_keys($password)
    @browser.find_element(name: 'commit').click
    $wait.until{@browser.find_element(css: '.alert-alert').displayed?}
    expect(@browser.find_element(css: '.alert-alert').text).to include($success_login_message)
    puts "Login successfully"
  end

  it "should show manager list" do
    $wait.until{@browser.find_element(css: '.header-section').displayed?}
    expect(@browser.find_element(css: '.header-section').text).to include("Quality Assurence Page")
    $wait.until{@browser.find_element(link_text: 'Manager List').displayed?}
    @browser.find_element(link_text: 'Manager List').click
    $wait.until{@browser.find_element(css: 'button.btn-success').displayed?}
    @browser.execute_script("window.scrollTo(0, document.body.scrollHeight)")
    puts "Displayed Managers list"
    sleep(2)
    @browser.quit
    puts "Finished test"
  end

end