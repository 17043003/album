def login
    post '/api/v1/auth/sign_in', params:  { email: @user.email, password: @user.password }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
end

def get_auth_params_from_login_response_headers(response)
    client = response.headers['client']
    token = response.headers['token']
    expiry = response.headers['expiry']
    uid = response.headers['uid']

    auth_params = {
      'token' => token,
      'client' => client,
      'uid' => uid,
      'expiry' => expiry
    }
    auth_params
end