class UserMailer < ApplicationMailer
  default :from =>'bbhuvnaprabhu@gmail.com'
   def account_activation(user)
    @user = user
    mail(:to=> @user.email, :subject=> 'ACCOUNT ACTIVATION')
  end

end
