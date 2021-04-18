Rails.application.routes.draw do
  scope "/:locale", locale: /es|en/ do
    root to: "searches#index"
    match 'searches', to: 'searches#index', via: [:get, :post]
  end
end
