require "smtp_tls"

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => 'googlemail.com',
  :authentication => :plain,
  :user_name => 'redgate.bughunter@googlemail.com',
  :password => 'red-gate'
}