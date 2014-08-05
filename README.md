# OpenRTB Client [![Build Status](https://travis-ci.org/realmedia/openrtb-ruby-client.svg?branch=master)][travis] [![Gem Version](https://badge.fury.io/rb/openrtb-client.svg)][rubygems]

[travis]: https://travis-ci.org/realmedia/openrtb-ruby-client
[rubygems]: http://badge.fury.io/rb/openrtb-client

## Installation

```
gem install openrtb-client
```

## Usage

```ruby
client = OpenRTB::Client.new do |cli|
  cli.proxy      = 'http://myproxy.net:5367'
  cli.user_agent = 'myadserver/1.0'
  cli.version    = '2.2'
  cli.logger     = Logger.new($stdout)
  cli.max_concurrency = 2
end

req = {
  "id": "23629773",
  "at": 2,
  "tmax": 150,
  "imp": [
    {
      "id": "1",
      "tagid": "0",
      "banner": {
        "w": 320,
        "h": 50,
        "battr": [
          10,
          14002,
          9
        ],
      }
    }
  ],
  "device": {
    "ua": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36"
    "ip": "64.60.206.226",
    "language": "en"
  },
  "user": {
    "id": "091016c886a3676cc7371e291aae0146741357xc",
    "ext" : {
      "sessiondepth": 1
    }
  }
}

res = client.execute do |queue|
  queue.post('http://api.example.com/exchange.json', req)
  queue.post('http://user:pass@api.another-example.com/exchange.json', req)
end

res.each do |r|
  pp r
end
```