class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :is_administrator? #This method is available in the views

    #Retrieves the current logged in user based on the session's user id
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    #Checks if the user is logged in and reteun s true if the current user is not nil
    def logged_in?
        !current_user.nil?
    end
    # Checks if the current session is for an admin user
    def is_administrator?
        session[:is_admin]
    end      

private
    #Makes sure that a user is logged in before they can access certain features
    #Redirects the user to the log in page if they are not loged in
    def require_login
        unless logged_in?
        flash[:error] = "You are not permitted to access this resource"
        redirect_to login_path
        end
    end

end