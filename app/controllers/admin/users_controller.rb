class Admin::UsersController < ApplicationController
  #ユーザーのログイン状態を確かめる。
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
