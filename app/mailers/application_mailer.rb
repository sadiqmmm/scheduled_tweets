class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@scheduled_tweets.com'
  layout 'mailer'
end
