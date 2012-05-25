# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CMUTsa::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address        => 'smtp.sendgrid.net',
    :port           => '25',
    :authentication => :plain,
    :user_name      => 'myemail@domain.com',
    :password       => 'mypassword',
    :domain         => 'mydomain.com'
}