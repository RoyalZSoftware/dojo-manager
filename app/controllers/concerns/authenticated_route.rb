module AuthenticatedRoute

  extend ActiveSupport::Concern

  included do
    before_action :check_user_is_signed_in_or_redirect

    private

    def check_user_is_signed_in_or_redirect
      if !user_signed_in?
        redirect_to '/user/sign_in'
      end
    end
  end
end
