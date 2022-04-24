class UserMailer < ApplicationMailer
  default from: 'registrations@odinbook.com'

  def success_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Odin Book!')
  end
end
