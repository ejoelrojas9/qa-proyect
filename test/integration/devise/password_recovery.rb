require 'webdrivers/chromedriver'
require 'byebug'
require_relative ('../login_info.rb')

describe "Given good credentials" do
  it "should login" do
    puts "\n\e[1;34m\e[47m -Running password recovery \e[m\n\n"
    @browser = Selenium::WebDriver.for :chrome
    # @browser.manage.window.maximize
    @browser.navigate.to ($url)
    $wait.until{@browser.find_element(xpath: '/html/body/div/div/div[2]/div[2]/div/div/a').displayed?}
    @browser.find_element(xpath: '/html/body/div/div/div[2]/div[2]/div/div/a').click
    $wait_message_form.until{@browser.find_element(css: 'div.login-title.text-center').displayed?}
    $wait_message_form.until{@browser.find_element(id: 'admin_email').displayed?}
    @browser.find_element(id: 'admin_email').send_keys($email)
    @browser.find_element(name: 'commit').click 
    $wait.until{@browser.find_element(css: '.text-white.bg-success').displayed?}
    expect(@browser.find_element(css: '.text-white.bg-success').text).to include($message_instruction)
    sleep(2)
    @browser.quit
    puts "Finished test"
  end
end

