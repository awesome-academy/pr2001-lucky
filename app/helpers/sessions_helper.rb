module SessionsHelper
    def log_in_user(user)
        session[:current_user_id] = user.id
    end
    def current_user
        @current_user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id] 
    end
    def logged_in_user? # Returns true if the user is logged in
        !current_user.nil?
    end
    def log_out_user
        session.delete(:current_user_id)
        @current_user = nil
    end
end
