Rails.application.routes.draw do
  root to: "searches#index"
  match 'searches', to: 'searches#index', via: [:get, :post]
end
