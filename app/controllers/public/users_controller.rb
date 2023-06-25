class Public::UsersController < ApplicationController
  before_action :check_guest, only: [:destroy, :update]


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = I18n.t('user.update_notice')
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = I18n.t('user.update_alert')
      render :edit
    end
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  # before_actionで呼び出し
  # ゲストユーザーの編集、削除を制限
  def check_guest
    if current_user.email == 'guest@example.com'
      redirect_to edit_user_path(current_user), alert: I18n.t('user.update_alert')
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :display_name, :introduction, :profile_image )
  end

end
