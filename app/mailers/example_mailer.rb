class ExampleMailer < ActionMailer::Base
  default from: "kapil23jani@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: "kapil.spaceo@gmail.com", subject: 'Welcome to our Family')
  end
end