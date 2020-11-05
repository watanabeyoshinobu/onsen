class ApplicationController < ActionController::Base

	  protect_from_forgery with: :exception
	  before_action :configure_permitted_parameters, if: :devise_controller?

	  protected

	  def configure_permitted_parameters
	  	added_attrs = [ :name, :email, :password ]
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	  end

	  def after_sign_out_path_for(resource)
	  	top_path
	  end

	  def after_sign_in_path_for(resource)
	  	browse_path
	  end
end
