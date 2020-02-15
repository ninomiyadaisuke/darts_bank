class ShopsController < ApplicationController
  
  before_action :require_login

  def new
    @shop = Shop.new
  end
  
  def my_shop
    @user = User.find(params[:id])
    @shop = Shop.find_by(user_id: @user.id)
  end
  
  def shop
    @shop = Shop.all
  end 
  
  def search_result
    @shops = Shop.page(params[:page]).per(5).where(prefecture_name: shop_params[:prefecture_name])
    render :shop
  end 
  
  def search
    @shop = Shop.new
  end 
  
  def create
    @shop = current_user.build_shop(shop_params)
    if @shop.save
      redirect_to my_shop_shops_path(id: current_user.id), success: '登録完了しました'
    else 
      flash.now[:danger] = '登録失敗しました'
      render :new
    end 
  end   
  
 def edit
   @shop = Shop.find(params[:id])
 end 
 
 def update
   @shop = Shop.find(params[:id])
   if @shop.update(shop_params)
     redirect_to my_shop_shops_path(id: current_user.id), success: '編集しました'
   else
     flash.now[:danger] = '編集に失敗しました'
     render :edit 
   end 
 end 
 
 def destroy
   @shop = Shop.find(params[:id])
   @shop.destroy
   redirect_to my_shop_shops_path(id: current_user.id), success: '削除しました'
 end 
    
  private
    
  def require_login
    if !logged_in?
      redirect_to root_path, danger: 'ログインしてください'
    end
  end
  
  def shop_params
    params.require(:shop).permit(:image, :shop_name, :postal, :prefecture_name, :address, :description )
  end   
end
