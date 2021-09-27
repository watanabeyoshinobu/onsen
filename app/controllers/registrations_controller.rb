class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :ensure_normal_user, only: %i[update destroy]



	  protected

	  def update_resource(resource, params)
	    resource.update_without_current_password(params)
	  end

end
