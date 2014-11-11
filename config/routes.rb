Rails.application.routes.draw do
  get 'rails/info/gems', controller: 'nanahoshi/info', action: 'index'
end
