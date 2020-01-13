module Website
  class PagesController < WebsiteController
    before_action :load_phones
    # before_action :load_treatments

    def genesis
    end

    def user_incorporation
    end

    def binational_package
    end

    def unlimited_professional_advice
    end

    def contact
    end

    def thank_you
    end

    def login
    end

    def sign_up
    end

    def password_recover
    end

    def password_success
    end

    def confirm
    end

    def dashboard
    end

    def step_1
    end

    def step_2
    end

    def step_3
    end

    def step_4
    end

    def step_5
    end

    def step_6
    end

    def step_7
    end

    def step_8
    end

    def step_9
    end

    def step_10
    end

    def step_11
    end

    def step_12
    end

    def step_13
    end

    def step_14
    end

    def step_15
    end

    def mail_thanks
    end

    def mail_confirm
    end

    def mail_welcome
    end

    def mail_password_reset
    end

    def mail_application
    end

    def instances_plural
    end

    def instances_singular_draft
    end

    def instances_singular_submitted
    end

    def instances_singular_accepted
    end

    def instances_singular_rejected
    end

    def instances_singular_cancelled
    end

    def instances_singular_completed
    end

    def payments
    end

    def payment
    end

    def invoices
    end

    def invoice
    end

    def payment_methods
    end

    def payment_method_new
    end

    def payment_method_edit
    end

    def admin_login
    end

    def admin_incorporations
    end

    def admin_incorporation
    end

    def home
      # @social_proofs = SocialProof.where(
      #   organization: @current_organization
      # )
      # @external_testimonials = Testimonial.where(
      #   organization: @current_organization,
      #   status: :ACCEPTED,
      #   source: :EXTERNAL
      # ).order(
      #   date: :desc
      # ).limit(10)
      # @internal_testimonials = Testimonial.where(
      #   organization: @current_organization,
      #   status: :ACCEPTED,
      #   source: :INTERNAL
      # ).order(
      #   date: :desc
      # ).limit(9)
    end

    def about_us
      @external_testimonials = Testimonial.where(
        organization: @current_organization,
        status: :ACCEPTED,
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
    end

    def contact_us
    end

    def price_list
      @categories = Category.includes(:items).all
    end

    def schedule_appointment_primary
    end

    def schedule_appointment_secondary
    end

    def the_team
      @primary_producers = Person.where(
        organization: @current_organization,
        status: :ACTIVE,
        primary_kind: :PRODUCER,
      )
      .where(
        name: [
          'Irving Cota',
          'Marcia Bustamante',
          'Aldo Sanchez'
        ]
      )
      @secondary_producers = Person.where(
        organization: @current_organization,
        status: :ACTIVE,
        primary_kind: :PRODUCER
      ).where.not(
        name: [
          'Irving Cota',
          'Marcia Bustamante',
          'Aldo Sanchez'
        ]
      )
      @external_testimonials = Testimonial.where(
        organization: @current_organization,
        status: :ACCEPTED,
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
    end

    def virtual_tour
      @social_proofs = SocialProof.where(
        organization: @current_organization
      )
      @external_testimonials = Testimonial.where(
        organization: @current_organization,
        status: :ACCEPTED,
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
      @internal_testimonials = Testimonial.where(
        organization: @current_organization,
        status: :ACCEPTED,
        source: :INTERNAL
      ).order(
        date: :desc
      ).limit(9)
    end
  end
end
