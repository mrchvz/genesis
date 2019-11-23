class ApplicationController < ActionController::Base
  before_action :check_current_organization

  def check_current_organization
    return if current_organization
    raise StandardError.new('Current organization not found')
  end

  def current_organization
    @current_organization = Organization.find_by(
      subdomain: 'gerardoaguiniga'
    )
  end
end
