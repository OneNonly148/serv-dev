module SessionHelper
  def logout
	session.delete(:user_id)
	@current_user = nil
  end
  def login(user)
	session[:user_id] = user.id
  end
  def current_user? (user)
	user == current_user
  end
  def current_user
	@current_user ||= (Management.find_by(id: session[:user_id]) || Customer.find_by(id: session[:user_id]) || ServicePartner.find_by(id: session[:user_id]))
  end
  def logged_in?
	!current_user.nil?
  end
end
