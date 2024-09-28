Rails.application.routes.draw do
  get '/books/new'
  post '/books' => 'books#create' #この記述正しい？
  get '/books' => 'books#index'  #この記述正しいか？　
  get 'books/show'
  get 'books/edit'
  get '/' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
