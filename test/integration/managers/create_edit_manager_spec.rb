require 'webdrivers/chromedriver'
require_relative ('../login_info.rb')

describe "Should success login" do
  before(:all) do
    puts "\n\e[1;34m\e[47m -Running Create Edit \e[m\n\n"
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
    $wait.until{@browser.find_element(css: 'table tbody').displayed?}
    puts "Displayed Managers list"
    tbody_label = (@browser.find_element(css: 'table tbody').text).to_s
    puts "Creating a new manager"
    @browser.find_element(css: '.btn.btn-success').click
    $wait.until{@browser.find_element(css: '.modal-content').displayed?}
    expect(@browser.find_element(css: '.modal-content').text).to include("Manager Form")
    @browser.find_element(id: 'manager_first_name').click
    @browser.find_element(id: 'manager_first_name').send_keys($manager_first_name)
    @browser.find_element(id: 'manager_last_name').click
    @browser.find_element(id: 'manager_last_name').send_keys($manager_last_name)
    @browser.find_element(id: 'manager_email').click
    @browser.find_element(id: 'manager_email').send_keys($manager_email)
    @browser.find_element(id: 'manager_phone').click
    @browser.find_element(id: 'manager_phone').send_keys($manager_phone)
    @browser.find_element(id: 'manager_city').click
    @browser.find_element(id: 'manager_city').send_keys($manager_city)
    @browser.find_element(id: 'manager_age').click
    @browser.find_element(id: 'manager_age').send_keys($manager_age)
    @browser.find_element(id: 'manager_notes').click
    @browser.find_element(id: 'manager_notes').send_keys($manager_notes)
    @browser.find_element(css: '.btn-outline-primary').click
    $wait.until{@browser.find_element(css: '.alert-alert h3:first-child').displayed?}
    expect(@browser.find_element(css: '.alert-alert h3:first-child').text).to include("Manager created")
    puts "Manager created"
    @browser.navigate.refresh
    puts "Displaying a manager"
  end

  it "shoul edit manager" do
    @browser.navigate().refresh()
    @browser.find_element(link_text: 'Settings').click
    $wait.until{@browser.find_element(css: '.modal-content').displayed?}
    expect(@browser.find_element(css: '.modal-content').text).to include("Manager Form")
    @browser.find_element(id: 'manager_first_name').click
    @browser.find_element(id: 'manager_first_name').clear
    @browser.find_element(id: 'manager_first_name').send_keys($manager_first_name)
    @browser.find_element(id: 'manager_last_name').click
    @browser.find_element(id: 'manager_last_name').clear
    @browser.find_element(id: 'manager_last_name').send_keys($manager_last_name)
    @browser.find_element(css: '.btn-outline-primary').click
    $wait.until{@browser.find_element(css: '.alert-alert h3:first-child').displayed?}
    expect(@browser.find_element(css: '.alert-alert h3:first-child').text).to include("Manager updated")
    puts "Manager edited"
    sleep(2)
    @browser.quit
    puts "Finished test"
  end

end
