module Website
  class OperationsController < WebsiteController
    def schedule
      params[:phone_country_code] = 'US' # TODO: Add country code in UI

      params.require(
        [
          :person_name,
          :email_address,
          :phone_country_code,
          :phone_number,
          :lead_desired_date
        ]
      )

      ActiveRecord::Base.transaction do
        person = Person.create!(
          organization: current_organization,
          status: :ACTIVE,
          name: params.fetch(:person_name),
          primary_kind: :CONSUMER,
        )

        email = Email.create!(
          organization: current_organization,
          emailable: person,
          address: params.fetch(:email_address),
          confirmed: false
        )

        phone = Phone.create!(
          organization: current_organization,
          phoneable: person,
          country_code: params.fetch(:phone_country_code),
          number: params.fetch(:phone_number),
          confirmed: false
        )

        person.primary_email = email
        person.primary_phone = phone
        person.save!

        Lead.create!(
          organization: current_organization,
          person: person,
          desired_date: params.fetch(:lead_desired_date),
          source: :WEBSITE,
          status: :SUBMITTED,
        )
      end

      head :ok
    end
  end
end
