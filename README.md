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
  id: "23629773",
  at: 2,
  tmax: 150,
  imp: [
    {
      id: "1",
      tagid: "0",
      banner: {
        w: 320,
        h: 50,
        battr: [
          10,
          14002,
          9
        ],
      }
    }
  ],
  site: {
    id: "90000",
    domain: "http://rtb.automatethistestplz.com",
    page: "http://66.150.149.26/qa/rst-mob-23-43-qa-ndb.html"
  },
  device: {
    ua: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36",
    ip: "64.60.206.226",
    language: "en",
    devicetype: 1,
  },
  user: {
    id: "091016c886a3676cc7371e291aae0146741357xc",
    ext: {
      sessiondepth: 1
    }
  }
}

res = client.execute do |queue|
  queue.post('http://api.example.com/exchange.json', req)
  queue.post('http://user:pass@api.another-example.com/exchange.json', req)
end

if res.any?
  win = res.max_by { |r| r[:seatbid][:bid].first[:price].to_i }
  puts win.inspect
end
```

## Copyright

Copyright (c) 2014 Realmedia Latin America.
See [LICENSE](https://github.com/realmedia/openrtb-ruby-client/blob/master/LICENSE) for details.