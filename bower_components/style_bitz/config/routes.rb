StyleBitz::Rails::Engine.routes.draw do
  root :to => 'style_guide#show'
  match 'pages/:demo_page' => 'style_guide#demo'
  match ':page' => 'style_guide#show', :as => :page
end
