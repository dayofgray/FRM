module ApplicationHelper

    def login_options
        if logged_in?
            link_to "Logout", logout_path
        else
            link_to "Login", login_path
        end
    end
end
