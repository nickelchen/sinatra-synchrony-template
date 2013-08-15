Sinatra fiber project template.

Sinatra project root directory: settings.root

console: pry -r './boot'

### 本项目包含两种模式

#### sintra-synchrony + mongo
`rackup`

#### sinatra-synchroy + em-mongo
`ruby app.rb`

### ab 测试

本机配置: 4核 i7 3.49GHz 16G

测试 mongo的一条 insert

`rackup`
```ruby
Concurrency Level:      100
Time taken for tests:   2.037 seconds
Complete requests:      1000
Failed requests:        0
Write errors:           0
Total transferred:      303000 bytes
HTML transferred:       32000 bytes
Requests per second:    490.95 [#/sec] (mean)
Time per request:       203.688 [ms] (mean)
Time per request:       2.037 [ms] (mean, across all concurrent requests)
Transfer rate:          145.27 [Kbytes/sec] received

```

`ruby app.rb`
```ruby
Concurrency Level:      100
Time taken for tests:   1.581 seconds
Complete requests:      1000
Failed requests:        0
Write errors:           0
Total transferred:      303000 bytes
HTML transferred:       32000 bytes
Requests per second:    632.32 [#/sec] (mean)
Time per request:       158.148 [ms] (mean)
Time per request:       1.581 [ms] (mean, across all concurrent requests)
Transfer rate:          187.10 [Kbytes/sec] received
```

`thin start -s 4 -e development -p 8080`  with nginx
```ruby
Concurrency Level:      100
Time taken for tests:   0.629 seconds
Complete requests:      1000
Failed requests:        0
Write errors:           0
Total transferred:      317000 bytes
HTML transferred:       32000 bytes
Requests per second:    1589.64 [#/sec] (mean)
Time per request:       62.908 [ms] (mean)
Time per request:       0.629 [ms] (mean, across all concurrent requests)
Transfer rate:          492.10 [Kbytes/sec] received
```

