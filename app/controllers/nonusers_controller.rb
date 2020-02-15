class NonusersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @topics = Topic.page(params[:page]).per(5).where(user_id: @user.id)
  end
  
end
