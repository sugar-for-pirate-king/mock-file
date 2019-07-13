# frozen_string_literal: true

Rails.application.routes.draw do
  scope :employees, module: :employees, as: :employees do
    resources :imports
  end
end
