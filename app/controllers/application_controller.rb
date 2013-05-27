class ApplicationController < ActionController::Base
   # skip_before_filter :login_required
  
	helper_method :current_user

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
=begin
	def login_required
		unless current_user
	    redirect_to "/login", :notice => 'please login first!'
	  end
	end

	def already_logged_in
	  unless current_user.nil?
	    redirect_to "/sessions/login_page/#{current_user.id}"
	  end
	end
=end
end