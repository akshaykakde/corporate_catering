module UsersHelper

  def first_method?(user)
    print "user.active = ", user.active
    !user.active
  end

  def second_method(user)
    return user.name
  end

end
