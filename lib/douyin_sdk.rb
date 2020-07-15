require "douyin_sdk/version"
require "douyin_sdk/client"

module DouyinSdk

  class << self

    def endpoint_url(url)
      "https://open.douyin.com"+url
    end

  end

end
