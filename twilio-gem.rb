# TODO: this didn't work 👿

require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = ENV.fetch("TWILIO_SID")
auth_token = ENV.fetch("TWILIO_TOKEN")
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
    :to => "+17133972814",
    :from => "+17135880273",
    :media_url => "http://www.example.com/hearts.png")
puts message.to
