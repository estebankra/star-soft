class ApplicationController < ActionController::Base
	def authenticate_secretary!
		redirect_to new_user_session_path unless user_signed_in? && current_user.is_secretary?
	end

	def authenticate_admin!
		redirect_to new_user_session_path unless user_signed_in? && current_user.is_admin?
	end
end