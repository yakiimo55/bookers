Rails.application.routes.draw do
# # get '/books/new'
#   post '/books' => 'books#create' #この記述正しい？
#   get '/books' => 'books#index'  #この記述正しいか？
#   get '/books/show'
#   get '/books/edit'
  resources :books, only: [:create, :index]

  root to: "homes#top"
  get 'books/:id' => 'books#show', as:'book'   #as以下は何のためにやってる？
  get 'books/:id/edit' => 'books#edit', as:'edit_book'
  patch 'books/:id' => 'books#update', as:'update_book'
  delete 'books/:id' => 'books#destroy', as:'destroy_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
