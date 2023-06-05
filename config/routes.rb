Rails.application.routes.draw do

  # 管理者側のルーティング設定
  namespace :admin do
    resources :users, only:[:index, :show]
  end

   # ユーザー側のルーティング設定
  scope module: :public do
    # 投稿のルートにいいねとコメントをネスト
    resources :posts, only:[:new, :create, :index, :show, :destroy]do
      resource :favorites, only:[:create, :destroy]
      resources :comments, only:[:create, :destroy]
    end
    # ユーザーのルートにフォロー、フォロワーをネスト
    resources :users, only:[:show, :edit, :update]do
      resource :relationships, only:[:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    root to: 'homes#top'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins, skip: [:registrations, :passwords] , controllers:{
    sessions: "admin/sessions"
  }

  # ユーザー用
  # URL /customers/sign_in ...
  devise_for :users, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
