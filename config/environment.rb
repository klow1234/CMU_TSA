# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CMUTsa::Application.initialize!

ActionMailer::Base.smtp_settings = {
	:address	=> "smtp.gmail.com",
	:port			=> 587,
	:user_name => "pdpstark",
	:password => ENV['GMAIL_PASS'],
	:authentication => "plain",
	:enable_starttls_auto => true
}