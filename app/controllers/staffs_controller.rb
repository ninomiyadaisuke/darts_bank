class StaffsController < ApplicationController
  
  before_action :require_login
  
  def index
    @user = User.find(params[:id])
    @staffs = Staff.page(params[:page]).per(5).where(user_id: @user.id)
  end 
  
  def new
    @staff = Staff.new
  end
  
  def create
    @staff = current_user.staffs.new(staff_params)
    
    if @staff.save
      redirect_to staffs_path(id: current_user.id), success: '登録完了しました'
    else 
      flash.now[:danger] = '登録失敗しました'
      render :new
    end 
  end 
  
  def edit
    @staff = Staff.find(params[:id])
  end
  
  def update
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      redirect_to staffs_path(id: current_user.id), success: '編集に成功しました'
    else
      flash.now[:danger] = '編集に失敗しました'
      render :edit
    end
  end 
  
  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    redirect_to staffs_path(id: current_user.id), success: '削除しました'
  end 
  
  
  private
  
  def require_login
    if !logged_in?
      redirect_to root_path, danger: 'ログインしてください'
    end
  end 
  
  def staff_params
    params.require(:staff).permit(:image, :staff_name, :nickname, :rating, :introduction )
  end 
end 
