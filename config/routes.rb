Rails.application.routes.draw do
  get 'rails/info/graph', controller: 'nanahoshi/info', action: 'index'
end
