class UserMailer < ApplicationMailer
  default from: 'postmaster@mg.topoutlines.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to Top Outlines')
  end

end
