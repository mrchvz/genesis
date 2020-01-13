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
      get 'mail-thanks'
      get 'mail-confirm'
      get 'mail-welcome'
      get 'mail-password-reset'
      get 'mail-application'
      get 'instances_plural'
      get 'instances_singular_draft'
      get 'instances_singular_submitted'
      get 'instances_singular_accepted'
      get 'instances_singular_rejected'
      get 'instances_singular_cancelled'
      get 'instances_singular_completed'
      get 'payments'
      get 'payment'
      get 'invoices'
      get 'invoice'
      get 'payment_methods'
      get 'payment_method_new'
      get 'payment_method_edit'
      get 'admin_login'
      get 'admin_incorporations'
      get 'admin_incorporation'
    end


    # controller :operations do
    #   post :schedule
    # end

    # # resources :pictures, only: [:index]
    # resources :posts, only: [:index, :show]
    # resources :treatments, only: [:index, :show]
  end
end
