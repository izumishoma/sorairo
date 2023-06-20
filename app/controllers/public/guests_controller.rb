class Public::GuestsController < ApplicationController
  def new_guest
   user = User.find_or_create_by!(email: 'guest@example.com',display_name: 'ゲストユーザー',name: 'ゲストユーザー') do |user|
     user.password = SecureRandom.urlsafe_base64
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
   end
   sign_in user
   redirect_to posts_path
  end
end
