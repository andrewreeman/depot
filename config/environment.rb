# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
    #config.action_mailer.delivery_method = :smtp
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
        address: "smtp.gmail.com",
        port: 587,
        domain: "andrewreeman.net",
        authentication: "plain",
        user_name: "andrew.reeman@gmail.com",
        password: "S2a4l8a16d32Fingers",
        enable_starttls_auto: true
    }
end

