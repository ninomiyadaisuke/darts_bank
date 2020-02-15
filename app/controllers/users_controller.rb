class UsersController < ApplicationController
  
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @topics = Topic.page(params[:page]).per(5).where(user_id: @user.id)
   
  end
  
  def create
    @user = User.new(user_params)
 
    if @user.save
      redirect_to sessions_new_path, success: '登録が完了しました。続けてログインしてください'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end 
  
  private
  
  def require_login
    if !logged_in?
      redirect_to root_path, danger: 'ログインしてください'
    end
  end
 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end
end 
