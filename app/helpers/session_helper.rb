module SessionHelper
  def logout
	session.delete(:user_id)
	@current_user = nil
  end
  def login(user)
	session[:user_id] = user.id
  end
  def current_user?(user)
	user == current_user
  end
  def current_user(email)
	temp_user ||= Management.find_by(id: session[:user_id])
	if temp_user && temp_user.email == email
		@current_user = temp_user
	end
  end
  def logged_in?
	!@current_user.nil?
  end
end
