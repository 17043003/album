# frozen_string_literal: true

module Api
  module V1
    module Auth
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        before_action :set_user

        def render_create_error
          render status: :unauthorized, json: { error: @user.errors.full_messages } unless @user.valid?
        end

        private

        def user_params
          params.require(:registration).permit(
            :name,
            :email,
            :password,
            :password_confirmation
          )
        end

        def set_user
          @user = User.new(user_params)
        end
      end
    end
  end
end
