module ApplicationHelper

    def login_options
        if logged_in?
            link_to "Logout", logout_path, method: "delete"
        else
            link_to("Login", login_path) + " " + link_to("Signup", signup_path)
        end
    end
end
