class TopicsController < ApplicationController
  
   before_action :require_login
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to user_path(current_user), success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to user_path(current_user), success: '投稿を編集しました'
    else 
      flash.now[:danger] = '編集に失敗しました'
      render :edit
    end
    
  end 
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to user_path(current_user), success: '投稿を削除しました'
  end

  private
  
  def require_login
    if !logged_in?
      redirect_to root_path, danger: 'ログインしてください'
    end
  end
  
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
