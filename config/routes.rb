Rails.application.routes.draw do
  mount API => '/api'
  mount GrapeSwaggerRails::Engine => '/api/doc'
end
