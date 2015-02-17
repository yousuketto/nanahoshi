# Nanahoshi

Nanahoshi is web ui for gem dependencies graph.

## Installation
Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'nanahoshi'
end
```

And then execute:

    $ bundle

## Usage
### For Rails
Start Rails server:

    $  bundle exec rails s -b 0.0.0.0

Access to ```http://localhost:3000/rails/info/gems```

### For without Rails
Start Nanahoshi server:

    $  nanahoshi -o 0.0.0.0

Access to ```http://localhost:9292```



## TODO
- standalone in ``bundle install --path gemdir`` environments.
- zoom in and zoom out

## Contributing

1. Fork it ( https://github.com/yousuketto/nanahoshi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
