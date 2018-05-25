class ApplicationController < ActionController::Base
before_action :configure_devise_params, if: :devise_controller?

	def configure_devise_params
		devise_parameter_sanitizer.permit(:sign_up) do |user|
			user.permit(:email, :name_1, :name_2, :last_name_1, :last_name_2, :number, :username, :password, :password_confirmation, :departament_id)
		end
	end

	
end
