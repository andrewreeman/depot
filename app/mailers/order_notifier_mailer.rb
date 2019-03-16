class OrderNotifierMailer < ApplicationMailer
  default from: 'Andy Reeman <andrew.reeman@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: "Pragmatic Store Order Confirmation"
    #mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: "Pragmatic Store Order Shipped"
    #mail to: "to@example.org"
  end
end
