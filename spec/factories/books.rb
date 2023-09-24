FactoryBot.define do
    factory :book do
      title { "Example Book Title" }
      uri { "http://example.com" }
      slug
    end
  end
  
  