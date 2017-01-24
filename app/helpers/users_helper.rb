module UsersHelper



  def first_method?(user)
    print "user.active = ", user.active
    user.active =! user.active
  end
end
