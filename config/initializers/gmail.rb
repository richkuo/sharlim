ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:authentication => 'plain',
	:enable_starttls_auto => true,
	:domain => 'www.shareilm.com',
	:user_name => ENV['GMAIL_USERNAME'],
	:password => ENV['GMAIL_PASSWORD']
}
