Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # 上記3行を以下の通り変更
  # onlyオプション：生成するルーティングを限定。不要なルーティングを実行しないようにする。
  resources :books, only:[:index, :show, :edit]

  get 'homes/about', as: 'about'
end
