class UserMailer < ApplicationMailer
 
  default :from =>'bbhuvnaprabhu@gmail.com'
  def account_activation(user)
    @user = user
    mail(:to=> @user.email, :subject=>'ACCOUNT ACTIVATION')
  end

  def account    
    mail(:to=> 'bhuvna@joshsoftware.com', :subject=>'ACCOUNT ACTIVATION')
  end
  
end
