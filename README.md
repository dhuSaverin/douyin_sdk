# DouyinSdk

Douyin SDK for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'douyin_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install douyin_sdk

## Usage
1.配置 ClientKey 和 ClientSecret

```ruby
$client = DouyinSdk::Client.new(client_key, client_secret)
```

* 抖音Oauth 2授权
    
1.获取用户授权链接：
```ruby
$client.auth_code_url(redirect_uri, scope)
```
  reirect_url为回调接收地址，scope为要获取的权限，详见官方文档
  
2.用户扫码授权后，根据code获取用户access_token，open_id和refresh_token等信息
```ruby
$client.access_token(code)
```

* 刷新access_token

```ruby
$client.refresh_token(refresh_token)
```

* 刷新refresh_token

通过旧的refresh_token获取新的refresh_token，调用后旧refresh_token会失效，新refresh_token有30天有效期。最多只能获取5次新的refresh_token，5次过后需要用户重新授权。
```ruby
$client.renew_refresh_token(client_key, refresh_token)
```

* 获取用户公开信息

```ruby
$client.user_info(access_token, open_id)
```

* 获取粉丝列表(需要在开放平台申请用户管理接口权限)

```ruby
$client.fan_list(access_token, open_id)
```
* 查询授权账号视频数据

```ruby
$client.video_list(access_token, open_id)
```

* 查询指定视频数据

    item_id为抖音视频id
```ruby
$client.video_data(access_token, open_id, item_id)
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dhuSaverin/douyin_sdk. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

