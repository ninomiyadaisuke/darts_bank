module ApplicationHelper
  
  def user_check
    logged_in? && @user.id == current_user.id 
  end
end
