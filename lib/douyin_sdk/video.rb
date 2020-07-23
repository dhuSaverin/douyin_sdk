# encoding: utf-8
module DouyinSdk
  module Video
    VIDEO_LIST = '/video/list/'
    VIDEO_DATA = '/video/data/'

    #获取用户视频列表
    def video_list(access_token, open_id, count = 10, cursor = 0)
      DouyinSdk.http_get(VIDEO_LIST + "?access_token=#{access_token}&open_id=#{open_id}&count=#{count}&cursor=#{cursor}")
    end

    #查询指定视频数据
    def video_data(access_token, open_id, item_id)
      DouyinSdk.http_post(VIDEO_DATA + "?access_token=#{access_token}&open_id=#{open_id}", {item_ids: [item_id] }.to_json)
    end

  end
end
