require "douyin_sdk/version"
require "douyin_sdk/client"
require 'net/http'
require 'uri'
require 'json'
module DouyinSdk

  class << self
    END_POINT = "https://open.douyin.com"

    def http_post(url, params)
      res = Net::HTTP.post(
          endpoint_uri(url),
          params,
          {'Content-Type': 'application/json'}
      )
      JSON.parse(res.body)
    end

    def http_get(url)
      JSON.parse(Net::HTTP.get(endpoint_uri(url)))
    end

    def endpoint_uri(url)
      URI.parse(endpoint_url(url))
    end

    def endpoint_url(url)
      END_POINT + url
    end


  end

end
