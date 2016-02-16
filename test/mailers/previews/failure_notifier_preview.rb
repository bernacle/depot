# Preview all emails at http://localhost:3000/rails/mailers/failure_notifier
class FailureNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/failure_notifier/error
  def error
    FailureNotifier.error
  end

end
