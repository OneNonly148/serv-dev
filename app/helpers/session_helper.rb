module SessionHelper
  def logout
	   session.delete(:user_id)
	   @current_user = nil
     @status = nil
     @admin = nil
  end
  def loginm(user)
	   session[:user_id]= user.id
     session[:status]= user.status
     session[:admin]= user.status
  end
  def mcurrent_user
    @current_user ||= Management.find_by(id: session[:user_id])
  end
  def loginc(user)
     session[:user_id]= user.id
  end
  def ccurrent_user
    @current_user ||= Customer.find_by(id: session[:user_id])
  end
  def logged_in?
    if $log == 1
      !mcurrent_user.nil?
    elsif $log == 2
      !ccurrent_user.nil?
    else
      return false
    end
  end
  def admin?
    if $log == 1
      @current_user.admin?
    elsif $log == 2
      @current_user.admin?
    else
      return false
    end
  end
end
