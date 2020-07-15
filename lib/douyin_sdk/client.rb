# encoding: utf-8
require "douyin_sdk/oauth"
require "douyin_sdk/user"
require "douyin_sdk/video"

module DouyinSdk

  class Client

    include Oauth

    attr_accessor :client_key, :client_secret, :scope # Time.now + expires_in
    # attr_accessor :access_token

    def initialize(client_key, client_secret)
      @client_key = client_key
      @client_key = client_secret
    end


  end
end
