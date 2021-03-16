# frozen_string_literal: true

module Api
  module V1
    module Auth
      class SessionsController < DeviseTokenAuth::SessionsController
        before_action :set_user

        def render_create_error_not_confirmed
          render json: { status: 401, error: current_api_v1_user&.errors }
        end

        def render_create_error_bad_credentials
          if @user.nil?
            render status: :unauthorized, json: { status: 401, error: '登録されていないメールアドレスです' }
            return
          end
          super
        end

        private

        def set_user
          @user = User.find_by(email: params['email'])
        end
      end
    end
  end
end
