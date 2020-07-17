# encoding: utf-8
module DouyinSdk
  module User
    USER_INFO = '/oauth/userinfo/'
    FAN_LIST = '/fans/list/'

    #获取用户信息
    def user_info(access_token, open_id)
      res = Typhoeus.post(DouyinSdk.endpoint_url(USER_INFO + "?access_token=#{access_token}&open_id=#{open_id}"))
      JSON.parse(res.body)
    end

    #获取粉丝列表
    def fan_list(access_token, open_id, count = 10, cursor = 0)
      res = Typhoeus.post(DouyinSdk.endpoint_url(FAN_LIST + "?access_token=#{access_token}&open_id=#{open_id}&count=#{count}&cursor=#{cursor}"))
      JSON.parse(res.body)
    end

  end
end
