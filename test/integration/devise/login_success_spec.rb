require 'webdrivers/chromedriver'
espera = Selenium::WebDriver::Wait.new(timeout: 15)

describe 'Login exitoso' do
  it "deberia hacer login" do
    explorer = Selenium::WebDriver.for :chrome
    explorer.navigate.to ("http://localhost:3000/admins/sign_in")
    explorer.find_element(id: 'admin_email').send_keys("test@example.com")
    explorer.find_element(id: 'admin_password').send_keys("test0102.")
    explorer.find_element(name: 'commit').click
    espera.until{explorer.find_element(xpath: '/html/body/div/div/div[1]/h3[1]').displayed?}
    expect(explorer.find_element(xpath: '/html/body/div/div/div[1]/h3[1]').text).to include("Signed in successfully.")  
    explorer.quit
    puts "Test finalizado"
  end
end
