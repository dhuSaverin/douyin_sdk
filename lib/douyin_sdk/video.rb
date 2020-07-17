# encoding: utf-8
module DouyinSdk
  module Video
    VIDEO_LIST = '/video/list/'
    VIDEO_DATA = '/video/data/'

    #获取用户视频列表
    def video_list(access_token, open_id, count = 10, cursor = 0)
      res = Typhoeus.get(DouyinSdk.endpoint_url(VIDEO_LIST + "?access_token=#{access_token}&open_id=#{open_id}&count=#{count}&cursor=#{cursor}"))
      JSON.parse(res.body)
    end

    #查询指定视频数据
    def video_data(access_token, open_id, item_id)
      res = Typhoeus.post(DouyinSdk.endpoint_url(VIDEO_DATA + "?access_token=#{access_token}&open_id=#{open_id}"), headers: {'Content-Type': 'application/json'},  body: {item_ids: [item_id] }.to_json)
      JSON.parse(res.body)
    end

  end
end
