class NonusershopsController < ApplicationController
  
  def nonuser_search
    @shop = Shop.new
  end 
  
  def nonuser_my_shop
    @user = User.find(params[:id])
    @shop = Shop.find_by(user_id: @user.id)
  end  
  
  def nonuser_search_result
    @shops = Shop.page(params[:page]).per(5).where(prefecture_name: shop_params[:prefecture_name])
    render :nonuser_shop
  end 
  
  def nonuser_shop
    @shops = Shop.all
  end 
  
  
  private
  def shop_params
    params.require(:shop).permit(:image, :shop_name, :postal, :prefecture_name, :address )
  end   
end
