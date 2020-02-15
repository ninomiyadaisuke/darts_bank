class NonuserstaffsController < ApplicationController
  
  def index
    @user = User.find(params[:id])
    @staffs = Staff.page(params[:page]).per(5).where(user_id: @user.id) 
  end 
  
end
