# encoding: utf-8
module DouyinSdk
  module Oauth
    OAUTH_CONNECT = '/platform/oauth/connect/'
    ACCESS_TOKEN = '/oauth/access_token/'
    REFRESH_TOKEN = '/oauth/refresh_token/'

    #获取授权连接
    def auth_code_url(redirect_uri, scope="user_info")
      DouyinSdk.endpoint_url(OAUTH_CONNECT + "?client_key=#{client_key}&response_type=code&scope=#{scope}&redirect_uri=#{redirect_uri}")
    end

    #获取access_token
    def access_token(code)
      res = Typhoeus.post(DouyinSdk.endpoint_url(ACCESS_TOKEN + "?client_key=#{client_key}&client_secret=#{client_secret}&code=#{code}&grant_type=authorization_code"))
      JSON.parse(res.body)
    end

    #刷新access_token
    def refresh_token(refresh_token)
      res = Typhoeus.get(DouyinSdk.endpoint_url(REFRESH_TOKEN + "?refresh_token=#{refresh_token}&client_key=#{CLIENT_KEY}&grant_type=refresh_token"))
      JSON.parse(res.body)
    end

  end
end
