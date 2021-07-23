Rails.application.routes.draw do
  root 'users#show'
  devise_for :users
  resources :groups, path: 'folders'
  resources :expenses

  get 'expenses/:expense_id/add_to_folder/:group_id' => 'grouped_expenses#create', as: :add_to_group
  delete 'expenses/:expense_id/delete_from_folder/:group_id' => 'grouped_expenses#delete', as: :delete_from_group

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
