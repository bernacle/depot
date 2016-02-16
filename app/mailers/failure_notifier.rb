class FailureNotifier < ApplicationMailer
  default from: 'Bug Report <report@depot.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.failure_notifier.error.subject
  #
  def error(cart)
    @cart = cart

    mail to: "brunoraphael89@gmail.com", subject: 'A error occurred'
  end
end
