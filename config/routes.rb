Mwrc2012::Application.routes.draw do

  get 'images/:resource.:format' => 'images#show', :as => 'images'

end
