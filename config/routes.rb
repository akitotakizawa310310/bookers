Rails.application.routes.draw do

# トップページをローカルホスト３０００に表示
  root to: 'root#top'
  
  resources :books
  get 'books/:id/edit' => 'books#edit', as: 'edit_books'

end
