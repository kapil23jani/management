class ContactMailer < ApplicationMailer
  default from: "kapil23jani@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: "kapil.spaceo@gmail.com", subject: 'Sample Email')
  end
end
