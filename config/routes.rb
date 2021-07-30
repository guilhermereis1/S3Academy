Rails.application.routes.draw do
  resources :notifications
  namespace :dashboard_user do
    get 'users/index'
    get 'students/:student_id' => 'users#show', as: :view_student
    get 'create_student' => 'users#create', as: :create_student
    post 'register_new_student' => 'users#register_new_student', as: :register_new_student
    get 'update_student/:student_id' => 'users#update_student', as: :update
    post 'save_student_updated/:student_id' => 'users#save_student_updated', as: :save_student
    delete 'delete_student/:student_id' => 'users#delete_student', as: :delete_student
    get 'home/index'
  end

  namespace :dashboard_student do
    post 'new_comment/:course_id/:lesson_id/:student_id' => "course#new_comment", as: :new_comment
    get 'delete_comment/:course_id/:student_id/:comment_id' => "course#delete_comment", as: :delete_comment
    get 'notifications/index'
    get 'course/:course_id' => "course#index", as: :course
    get 'home/index'
  end
  devise_for :students
  delete 'delete_video/:course_id/:lesson_id' => "courses#delete_video_section", as: :delete_video_section
  resources :lessons

  get 'move_video_to_up/:course_id/:lesson_id' => 'courses#move_to_up_video', as: :move_video_to_up
  get 'move_video_to_bottom/:course_id/:lesson_id' => 'courses#move_to_bottom_video', as: :move_video_to_bottom
  
  get 'move_section_to_up/:course_id/:section_id' => 'courses#move_to_up', as: :move_section_to_up
  get 'move_section_to_bottom/:course_id/:section_id' => 'courses#move_to_bottom', as: :move_section_to_bottom

  post 'add_video_section/:course_id/:section_id' => "courses#add_video_section", as: :add_video_section_in_course
  post 'create_section_in_course/:course_id' => "courses#create_section", as: :create_section_in_course
  delete 'destroy_section_in_course/:course_id/:section_id' => "courses#destroy_section", as: :destroy_section_in_course
  post 'update_section_in_course/:course_id/:section_id' => "courses#update_section", as: :update_section_in_course

  resources :sections
  resources :courses
  devise_for :users

  get "/admin" => "dashboard_user/home#index"
  root to: 'dashboard_student/home#index'
end
