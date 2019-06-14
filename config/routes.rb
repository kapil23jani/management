Rails.application.routes.draw do

  devise_for :students
  devise_for :professors, controllers: { confirmations: 'professors/confirmations', registrations: 'professors/registrations', sessions: 'professors/sessions'}
  devise_for :users, controllers: { confirmations: 'users/confirmations', registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcomes#index"
  
  resources :welcomes

  resources :users do 
    resources :schools do 
      resources :divisions do 
        resources :attendances
      end
    end
    resources :professors 
    resources :students
    resources :students do 
      collection { post :import }
    end
    resources :attendances
  end



  get '/searching_student' , to:'students#searching_student'
  get '/schools/:school_id/school_divisions', to: 'welcomes#school_divisions', as: "school_divisions"
  get 'schools/:school_id/divisions/:division_id/division_attendance', to: 'welcomes#division_attendance', as: "division_attendance"
  get '/search_by_school', to: 'welcomes#search_by_school'
  get '/import_student', to: 'students#import_student'
  get '/teacher_assign', to: 'divisions#teacher_assign'
  get '/schools/:school_id/division_school', to: 'attendances#division_school', as: "school_division"
  get '/all_attendance', to: 'attendances#all_attendance'
  get '/schools/school_id/divisions/:division_id/remove_teacher', to: "divisions#remove_teacher", as: "remove_teacher"

end
