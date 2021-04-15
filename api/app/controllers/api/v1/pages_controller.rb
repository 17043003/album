module Api
    module V1
      class PagesController < ApplicationController
        before_action :authenticate_api_v1_user!

        def index
          pages = Page.where(user_id: current_api_v1_user.id)
            render json: {
              status: 'success',
              pages: current_api_v1_user.pages
            }
        end

        def create
          page = current_api_v1_user.pages.new(page_params)
          if page.save
            render json: { status: 'success', message: 'ページ作成に成功' }
          else
            render json: { status: 'failure', message: 'ページ作成に失敗' }
          end
        end

        private
        def page_params
          params.require(:page).permit(
            :title,
            :content
          )
        end
      end
    end
end