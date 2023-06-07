Rails.application.routes.draw do

  # 管理者側のルーティング設定
  namespace :admin do
    resources :users, only:[:index, :show]
    post '/guests/guest_sign_in', to: 'guests#new_guest'
  end

   # ユーザー側のルーティング設定
  scope module: :public do
    # 投稿のルートにいいねとコメントをネスト
    resources :posts, only:[:new, :create, :index, :show, :destroy]do
      resource :favorites, only:[:create, :destroy]
      resources :comments, only:[:create, :destroy]
    end
    resources :users, only:[:show, :edit, :update]do
      # ユーザーのパスにいいね一覧画面をネスト
      member do
        get 'favorites'
      end
    # ユーザーのパスにフォロー、フォロワーをネスト
      resource :relationships, only:[:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    # ゲストログインパス
    post '/guests/guest_sign_in', to: 'guests#new_guest'
    # 検索パス
    get "search" => "searches#search"
    root to: 'homes#top'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] , controllers:{
    sessions: "admin/sessions"
  }

  # ユーザー用
  # URL /customers/sign_in ...
  devise_for :user, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
