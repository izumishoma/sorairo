class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "登録情報を編集しました"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "編集に失敗しました"
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :display_name, :introduction, :profile_image )
  end
  
end
