Rails.application.routes.draw do
  root "games#index"
  post "games/move", to: "games#move"
  post "games/reset", to: "games#reset"
end
