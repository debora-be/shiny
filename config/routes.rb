Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Root path route
  # Uncomment the next line to set 'articles#index' as the root path of your application.
  # root "articles#index"
  
  # Nested resources for slugs and their books
  resources :slugs do
    resources :books, only: [:index] 
  end
  
  # Standard RESTful routes for books
  resources :books
  
  # Custom route for scraping books
  get '/scrape_books', to: 'books#scrape_books'
end
