# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def signup
        user = User.new(user_params)
        if user.save
          render json: { status: 'success', message: 'ユーザー登録が完了しました' }
        else
          render json: { status: 'failed', message: '登録に失敗しました' }
        end
      end

      private

      def user_params
        params.require(:user).permit(
          :name,
          :email
        )
      end
    end
  end
end
