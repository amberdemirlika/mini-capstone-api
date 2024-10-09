# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"
    resource "*", headers: :any, methods: [:get, :post, :patch, :put]
    origins "mini-capstone.peterxjang.com", "localhost:5173"
  end
end
