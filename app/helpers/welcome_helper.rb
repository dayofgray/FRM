module WelcomeHelper

    def welcome_user
        if logged_in?
            "Welcome to FRM, #{current_user.first_name}"
        else
            "Welcome to FRM"
        end
    end
end
