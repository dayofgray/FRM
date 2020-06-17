module ApplicationHelper

    def login_options
        if logged_in?
            button_to "Logout", logout_path, method: "delete"
        else
            button_to("Login", login_path, method: "get") + raw("<br>") + button_to("Signup", signup_path, method: "get")
        end
    end

    def my_user_page
        if logged_in?
            button_to "My User Page", user_path(current_user), method: "get"
        end
    end
end
