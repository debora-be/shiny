Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Root path route
  # Uncomment the next line to set 'articles#index' as the root path of your application.
  # root "articles#index"
  
  # Nested resources for authors and their books
  resources :authors do
    resources :books, only: [:index] # This will give a route for listing books of a specific author
  end
  
  # Standard RESTful routes for books
  resources :books
  
  # Custom route for scraping books
  get '/scrape_books', to: 'books#scrape_books'
end
