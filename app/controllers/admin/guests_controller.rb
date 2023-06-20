class Admin::GuestsController < ApplicationController
  def new_guest
   admin = Admin.find_or_create_by!(email: 'guest@example.com') do |admin|
     admin.password = SecureRandom.urlsafe_base64
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
   end
   sign_in admin
   redirect_to admin_users_path, notice: 'ゲスト管理者としてログインしました。'
  end
end
