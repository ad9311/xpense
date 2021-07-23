Rails.application.routes.draw do
  root 'users#show'
  devise_for :users
  resources :groups, path: 'folders'
  resources :expenses

  get 'external_expenses', to: 'expenses#index_ungrouped'
  get 'expenses/:expense_id/add_to_folder/:group_id', to: 'grouped_expenses#add_from_expense', as: :add_to_group
  delete 'expenses/:expense_id/delete_from_folder/:group_id', to: 'grouped_expenses#delete', as: :delete_from_group

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
