Rails.application.routes.draw do
  namespace :website, {
      path: '',
      constraints: {
        subdomain: ['', 'www']
    }
  } do

    root 'pages#home'

    controller :pages do
      get 'about-us'
      get 'contact-us'
      get 'price-list'
      get 'schedule-appointment-primary'
      get 'schedule-appointment-secondary'
      get 'the-team'
      get 'virtual-tour'
      get 'genesis'
      get 'user-incorporation'
      get 'binational-package'
      get 'unlimited-professional-advice'
      get 'contact'
      get 'thank-you'
      get 'login'
      get 'sign-up'
      get 'password-recover'
      get 'password-success'
      get 'confirm'
      get 'dashboard'
      get 'step_1'
      get 'step_2'
      get 'step_3'
      get 'step_4'
      get 'step_5'
      get 'step_6'
      get 'step_7'
      get 'step_8'
      get 'step_9'
      get 'step_10'
      get 'step_11'
      get 'step_12'
      get 'step_13'
      get 'step_14'
      get 'step_15'


    end


    # controller :operations do
    #   post :schedule
    # end

    # # resources :pictures, only: [:index]
    # resources :posts, only: [:index, :show]
    # resources :treatments, only: [:index, :show]
  end
end
