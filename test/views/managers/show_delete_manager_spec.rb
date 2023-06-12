require 'webdrivers/chromedriver'
require 'byebug'
require_relative ('../login_info.rb')

describe "Should success login" do
  before(:all) do
    puts "\n\e[1;34m\e[47m -Running Show Delete \e[m\n\n"
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
    if tbody_label == ""
      puts "Creating a new manager"
      @browser.find_element(css: '.btn.btn-success').click
      $wait.until{@browser.find_element(css: '.modal-content').displayed?}
      expect(@browser.find_element(css: '.modal-content').text).to include("Manager Form")
      @browser.find_element(id: 'manager_first_name').click
      @browser.find_element(id: 'manager_first_name').send_keys("Joel")
      @browser.find_element(id: 'manager_last_name').click
      @browser.find_element(id: 'manager_last_name').send_keys("Rojas")
      @browser.find_element(id: 'manager_email').click
      @browser.find_element(id: 'manager_email').send_keys("ejoelrojas9@gmail.com")
      @browser.find_element(id: 'manager_phone').click
      @browser.find_element(id: 'manager_phone').send_keys("3216676200")
      @browser.find_element(id: 'manager_city').click
      @browser.find_element(id: 'manager_city').send_keys("San Antonio")
      @browser.find_element(id: 'manager_age').click
      @browser.find_element(id: 'manager_age').send_keys(44)
      @browser.find_element(id: 'manager_notes').click
      @browser.find_element(id: 'manager_notes').send_keys("Notes")
      @browser.find_element(css: '.btn-outline-primary').click
      $wait.until{@browser.find_element(css: '.alert-alert h3:first-child').displayed?}
      expect(@browser.find_element(css: '.alert-alert h3:first-child').text).to include("Manager created")
      puts "Displaying a manager"
      @browser.navigate().refresh()
      @browser.find_element(link_text: 'Delete').click
      delete = @browser.switch_to.alert
      delete.accept
      $wait.until{@browser.find_element(css: '.alert-alert h3:last-child').displayed?}
      expect(@browser.find_element(css: '.alert-alert h3:last-child').text).to include("Manager deleted")
    else
      puts "Displaying a manager"
      @browser.find_element(css: 'tr:last-child td a:last-child').click
      $wait.until{@browser.find_element(css: '.header-section h3').displayed?}
      expect(@browser.find_element(css: '.header-section h3').text).to include("Access de information of the manager")
      @browser.navigate().refresh()
      @browser.find_element(link_text: 'Delete').click
      delete = @browser.switch_to.alert
      delete.accept
      $wait.until{@browser.find_element(css: '.alert-alert h3:last-child').displayed?}
      expect(@browser.find_element(css: '.alert-alert h3:last-child').text).to include("Manager deleted")
    end
    sleep(2)
    @browser.quit
    puts "Finished test"
  end

end