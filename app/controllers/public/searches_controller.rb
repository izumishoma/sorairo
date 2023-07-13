class Public::SearchesController < ApplicationController
  #ユーザーのログイン状態を確かめる。
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == I18n.t('search.user')
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end
end
