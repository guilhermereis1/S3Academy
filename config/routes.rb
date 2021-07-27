Rails.application.routes.draw do
  namespace :dashboard_student do
    get 'course/:course_id' => "course#index", as: :course
    get 'home/index'
  end
  devise_for :students
  delete 'delete_video/:course_id/:lesson_id' => "courses#delete_video_section", as: :delete_video_section
  resources :lessons
  post 'add_video_section/:course_id/:section_id' => "courses#add_video_section", as: :add_video_section_in_course
  post 'create_section_in_course/:course_id' => "courses#create_section", as: :create_section_in_course
  delete 'destroy_section_in_course/:course_id/:section_id' => "courses#destroy_section", as: :destroy_section_in_course
  post 'update_section_in_course/:course_id/:section_id' => "courses#update_section", as: :update_section_in_course

  resources :sections
  resources :courses
  devise_for :users
  namespace :dashboard_user do
    get 'home/index'
  end
  get "/admin" => "dashboard_user/home#index"
  root to: 'dashboard_student/home#index'
end
