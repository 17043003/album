# frozen_string_literal: true

module Api
  module V1
    class AcountController < ApplicationController
      before_action :authenticate_api_v1_user!

      def show
        if api_v1_user_signed_in?
          render json: { status: 'success', data: current_api_v1_user }
        else
          render json: { status: 'failed', data: '' }
        end
      end
    end
  end
end
