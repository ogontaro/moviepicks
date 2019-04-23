# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web, at: "/sidekiq"
end
