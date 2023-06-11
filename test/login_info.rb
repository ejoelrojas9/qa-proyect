require 'faker'

$url = "http://localhost:3000/admins/sign_in".freeze
$email = "test@example.com".freeze
$fail_email = "test1@example.com".freeze
$password = "test0102.".freeze

# Timeout
$wait = Selenium::WebDriver::Wait.new(timeout: 15)

# Messages
$success_login_message = "Signed in successfully."
