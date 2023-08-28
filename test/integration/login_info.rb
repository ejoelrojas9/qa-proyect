require 'faker'

$url = "http://localhost:3000/admins/sign_in".freeze
$email = "test@example.com".freeze
$fail_email = "test1@example.com".freeze
$password = "test0102.".freeze
$fail_password = "test0102"

# Timeout
$wait = Selenium::WebDriver::Wait.new(timeout: 15)
exception_stale_error = Selenium::WebDriver::Error::StaleElementReferenceError
$wait_message_form = Selenium::WebDriver::Wait.new(timeout: 30, interval: 2, message: 'Timed out after 30 sec', ignore: exception_stale_error)

# Messages
$success_login_message = "Signed in successfully."
$fail_login_message ="Invalid Email or password."
$forgot_password = "Forgot your password?"
$message_instruction = "You will receive an email with instructions on how to reset your password in a few minutes."
$access_managers_list_message = "Access de information of the managers"

# Input data
$manager_first_name = Faker::Name.first_name
$manager_last_name = Faker::Name.last_name
$manager_email = Faker::Internet.email
$manager_phone = Faker::PhoneNumber.cell_phone
$manager_city = Faker::Address.city
$manager_age = Faker::Number.between(from: 20, to: 50)
$manager_notes = Faker::Gender.binary_type
