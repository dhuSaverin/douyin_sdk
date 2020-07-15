# encoding: utf-8
module DouyinSdk
  module Oauth

    #获取
    def auth_code_url(redirect_uri, scope="user_info")
      action = '/platform/oauth/connect/'
      DouyinSdk.endpoint_url(action + "?client_key=#{client_key}&response_type=code&scope=#{scope}&redirect_uri=#{redirect_uri}")
    end

    def access_token(code)
      action = '/oauth/access_token/'
      res = Typhoeus.post(DouyinSdk.endpoint_url(action + "?client_key=#{client_key}&client_secret=#{client_secret}&code=#{code}&grant_type=authorization_code"))
      JSON.parse(res.body)
    end

    def refresh_token(refresh_token)
      action = '/oauth/refresh_token/'
      res = Typhoeus.get(DouyinSdk.endpoint_url(action + "?refresh_token=#{refresh_token}&client_key=#{CLIENT_KEY}&grant_type=refresh_token"))
      JSON.parse(res.body)
    end

  end
end
