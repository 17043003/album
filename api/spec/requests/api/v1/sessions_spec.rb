# frozen_string_literal: true

require 'rails_helper'
include ActionController::RespondWith

describe 'Request devise_token_auth', type: :request do
    before(:each) do
        @user = FactoryBot.create(:user)
    end

    context 'Authentication via devise_token_auth' do
        it "doesn't show anything if you don't login" do
            get '/api/v1/acount'
            expect(response).to have_http_status(401)
        end

        it 'logged in successfully' do
            login
            # puts "#{response.headers.inspect}"
            # puts "#{response.body.inspect}"
            expect(response.has_header?('token')).to eq(true)
        end

        it 'shows mypage when you logged in' do
            login
            get '/api/v1/acount', headers: get_auth_params_from_login_response_headers(response)
            expect(response).to have_http_status(200)
        end

        it 'logged out successfully' do
            login
            delete '/api/v1/auth/sign_out', headers: get_auth_params_from_login_response_headers(response)
            expect(@user.reload.tokens).to be_blank
        end
    end
end