# encoding: utf-8
module DouyinSdk

  class Client

    include Oauth
    include User
    include Video

    attr_accessor :client_key, :client_secret, :scope # Time.now + expires_in
    attr_accessor :access_token, :redis_key, :custom_access_token

    def initialize(client_key, client_secret)
      @client_key = client_key
      @client_key = client_secret
    end


    # 获取js sdk 签名包
    def get_jssign_package(url)
      timestamp = Time.now.to_i
      noncestr = SecureRandom.hex(16)
      str = "jsapi_ticket=#{get_jsticket}&noncestr=#{noncestr}&timestamp=#{timestamp}&url=#{url}";
      signature = Digest::SHA1.hexdigest(str)
      {
        "appId"     => app_id,    "nonceStr"  => noncestr,
        "timestamp" => timestamp, "url"       => url,
        "signature" => signature, "rawString" => str
      }
    end

    private

      def access_token_param
        {access_token: get_access_token}
      end

      def security_redis_key(key)
        Digest::MD5.hexdigest(key.to_s).upcase
      end

  end
end
