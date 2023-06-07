class Public::FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @favorite.save
    redirect_back(fallback_location: root_path)  #一つ前のページへリダイレクトさせる。
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @favorite.destroy
    redirect_back(fallback_location: root_path)  #一つ前のページへリダイレクトさせる。
  end
end
