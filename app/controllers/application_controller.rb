class ApplicationController < ActionController::Base

	  protect_from_forgery with: :exception
	  before_action :configure_permitted_parameters, if: :devise_controller?

	  protected

	  def configure_permitted_parameters
	  	added_attrs = [ :name, :email, :password ]
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	  end

	  def after_sign_out_path_for(resource)
	  	top_path
	  end

	  def after_sign_in_path_for(resource)
	  	browse_path
	  end

	  def guest_sign_in
		    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
		      user.name = "ゲスト"
		      user.password = SecureRandom.urlsafe_base64
		      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
		      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
		    sign_in user
		    redirect_to browse_path, notice: 'ゲストユーザーとしてログインしました。'
		  end

	  end

end
